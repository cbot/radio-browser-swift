public struct Tag: Decodable {
    public let name: String
    public let stationCount: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case stationCount = "stationcount"
    }
}
