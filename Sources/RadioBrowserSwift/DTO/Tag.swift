public struct Tag: Decodable, Sendable {
    public let name: String
    public let stationCount: Int

    enum CodingKeys: String, CodingKey {
        case name
        case stationCount = "stationcount"
    }
}
