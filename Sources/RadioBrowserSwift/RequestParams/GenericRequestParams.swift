import Foundation

public class GenericRequestParams<Order: Encodable>: RequestParams {
    public let order: Order?
    public let reverse: Bool?
    public let hidebroken: Bool?
    public let offset: Int?
    public let limit: Int?

    public init(order: Order? = nil, reverse: Bool? = nil, hidebroken: Bool? = nil, offset: Int? = nil, limit: Int? = nil) {
        self.order = order
        self.reverse = reverse
        self.hidebroken = hidebroken
        self.offset = offset
        self.limit = limit
    }
}
