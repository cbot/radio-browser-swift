import Foundation

public struct Station: Decodable, Sendable, Equatable {
    public let bitrate: Int
    public let changeUUID: UUID
    public let clickCount: Int
    public let clickTimestamp: String
    public let clickTimestampISO8601: String?
    public let clickTrend: Int
    public let codec: String
    public let country: String
    public let countryCode: String
    public let favicon: String
    public let geoLat: Double?
    public let geoLong: Double?
    public let hasExtendedInfo: Bool
    public let hls: Int
    public let homepage: String
    public let iso31662: String?
    public let language: String
    public let languageCodes: String
    public let lastChangeTime: String?
    public let lastChangeTimeISO8601: String?
    public let lastCheckOK: Int
    public let lastCheckOKTime: String?
    public let lastCheckOKTimeISO8601: String?
    public let lastCheckTime: String?
    public let lastCheckTimeISO8601: String?
    public let lastLocalCheckTime: String?
    public let lastLocalCheckTimeISO8601: String?
    public let name: String
    public let sslError: Int
    public let state: String
    public let stationUUID: UUID
    public let tags: String
    public let url: String
    public let urlResolved: String
    public let votes: Int

    enum CodingKeys: String, CodingKey {
        case bitrate
        case changeUUID = "changeuuid"
        case clickCount = "clickcount"
        case clickTimestamp = "clicktimestamp"
        case clickTimestampISO8601 = "clicktimestamp_iso8601"
        case clickTrend = "clicktrend"
        case codec
        case country
        case countryCode = "countrycode"
        case favicon
        case geoLat = "geo_lat"
        case geoLong = "geo_long"
        case hasExtendedInfo = "has_extended_info"
        case hls
        case homepage
        case iso31662 = "iso_3166_2"
        case language
        case languageCodes = "languagecodes"
        case lastChangeTime = "lastchangetime"
        case lastChangeTimeISO8601 = "lastchangetime_iso8601"
        case lastCheckOK = "lastcheckok"
        case lastCheckOKTime = "lastcheckoktime"
        case lastCheckOKTimeISO8601 = "lastcheckoktime_iso8601"
        case lastCheckTime = "lastchecktime"
        case lastCheckTimeISO8601 = "lastchecktime_iso8601"
        case lastLocalCheckTime = "lastlocalchecktime"
        case lastLocalCheckTimeISO8601 = "lastlocalchecktime_iso8601"
        case name
        case sslError = "ssl_error"
        case state
        case stationUUID = "stationuuid"
        case tags
        case url
        case urlResolved = "url_resolved"
        case votes
    }
    
    public static func == (lhs: Station, rhs: Station) -> Bool {
        lhs.stationUUID == rhs.stationUUID
    }
}
