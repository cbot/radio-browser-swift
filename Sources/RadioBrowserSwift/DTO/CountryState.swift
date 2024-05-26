public struct CountryState: Decodable {
    public let name: String
    public let country: String
    public let stationCount: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case country = "country"
        case stationCount = "stationcount"
    }
}
