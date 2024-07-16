public struct StationQuery {
    public enum QueryType: String {
        case byUUID = "byuuid"
        case byName = "byname"
        case byNameExact = "bynameexact"
        case byCodec = "bycodec"
        case byCodecExact = "bycodecexact"
        case byCountry = "bycountry"
        case byCountryExact = "bycountryexact"
        case byCountryCodeExact = "bycountrycodeexact"
        case byState = "bystate"
        case byStateExact = "bystateexact"
        case byLanguage = "bylanguage"
        case byLanguageExact = "bylanguageexact"
        case byTag = "bytag"
        case byTagExact = "bytagexact"
    }

    public let query: String
    public let queryType: QueryType

    var pathComponents: [String] {
        [queryType.rawValue, query]
    }

    public init(query: String, queryType: StationQuery.QueryType) {
        self.query = query
        self.queryType = queryType
    }
}
