import AsyncDNSResolver
import Foundation

public actor RadioBrowserClient {
    public enum Server {
        case any
        case specific(URL)
    }

    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private var servers = [URL]()
    private var selectedServer = Server.any

    public init() {}

    // MARK: - Public

    public func fetchServers() async throws -> [URL] {
        let resolver = try AsyncDNSResolver()
        let records = try await resolver.querySRV(name: "_api._tcp.radio-browser.info")
        let servers = records.compactMap {
            var components = URLComponents()
            components.host = $0.host
            components.port = Int($0.port)
            components.scheme = $0.port == 443 ? "https" : "http"
            return components.url
        }

        return servers
    }

    public func fetchCountries(filter: String? = nil, params: GenericRequestParams<GenericOrder>? = nil) async throws -> [Country] {
        let request = try await buildRequest(components: ["countries", filter], params: params)
        return try await fetchAndDecode(request: request)
    }

    public func fetchLanguages(filter: String? = nil, params: GenericRequestParams<GenericOrder>? = nil) async throws -> [Language] {
        let request = try await buildRequest(components: ["languages", filter], params: params)
        return try await fetchAndDecode(request: request)
    }

    public func fetchCodecs(filter: String? = nil, params: GenericRequestParams<GenericOrder>? = nil) async throws -> [Codec] {
        let request = try await buildRequest(components: ["codecs", filter], params: params)
        return try await fetchAndDecode(request: request)
    }

    public func fetchTags(filter: String? = nil, params: GenericRequestParams<GenericOrder>? = nil) async throws -> [Tag] {
        let request = try await buildRequest(components: ["tags", filter], params: params)
        return try await fetchAndDecode(request: request)
    }

    public func fetchStates(country: String? = nil, filter: String? = nil, params: GenericRequestParams<GenericOrder>? = nil) async throws -> [CountryState] {
        let request = try await buildRequest(components: ["states", country.map { "\($0)/" }, filter], params: params)
        return try await fetchAndDecode(request: request)
    }

    public func fetchStations(query: StationQuery? = nil, params: GenericRequestParams<StationsOrder>? = nil) async throws -> [Station] {
        let stationQueryComponents = query?.pathComponents ?? []
        let request = try await buildRequest(components: ["stations"] + stationQueryComponents, params: params)
        return try await fetchAndDecode(request: request)
    }

    public func fetchStation(uuid: UUID) async throws -> Station {
        if let station = try await fetchStations(query: .init(query: uuid.uuidString, queryType: .byUUID)).first {
            return station
        } else {
            throw RadioBrowserError.noSuchStation
        }
    }

    public func setSelectedServer(_ server: Server) {
        selectedServer = server
    }

    // MARK: - Utility

    private func buildRequest(components: [String?], params: RequestParams?) async throws -> URLRequest {
        var url = try await getBaseUrl()
        for component in components.compactMap({ $0 }) {
            if component.hasSuffix("/") {
                url.append(component: component.dropLast(), directoryHint: .isDirectory)
            } else {
                url.append(component: component, directoryHint: .notDirectory)
            }
        }

        var request = URLRequest(url: url)

        if let params {
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try encoder.encode(params)
        }

        return request
    }

    private func fetchAndDecode<T: Decodable>(request: URLRequest) async throws -> T {
        let data = try await URLSession.shared.data(for: request).0
        return try decoder.decode(T.self, from: data)
    }

    private func getBaseUrl() async throws -> URL {
        switch selectedServer {
        case .any:
            if servers.isEmpty {
                servers = try await fetchServers().shuffled()
            }

            if let firstServer = servers.first {
                return firstServer.appending(component: "json")
            } else {
                throw RadioBrowserError.noAvailableServer
            }
        case let .specific(url):
            return url
        }
    }
}
