public struct Country: Decodable, Sendable {
    public let name: String
    public let stationCount: Int
    public let iso31661: String

    enum CodingKeys: String, CodingKey {
        case name
        case stationCount = "stationcount"
        case iso31661 = "iso_3166_1"
    }
}
