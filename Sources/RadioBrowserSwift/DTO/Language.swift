public struct Language: Decodable {
    public let name: String
    public let stationCount: Int
    public let iso639: String?

    enum CodingKeys: String, CodingKey {
        case name
        case stationCount = "stationcount"
        case iso639 = "iso_639"
    }
}
