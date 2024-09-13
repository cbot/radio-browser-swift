public struct CountryState: Decodable, Sendable {
    public let name: String
    public let country: String
    public let stationCount: Int

    enum CodingKeys: String, CodingKey {
        case name
        case country
        case stationCount = "stationcount"
    }
}
