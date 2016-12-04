import APIKit
import Himotoki

struct HotEntryRequest: BookmarkRequest {
    var method: HTTPMethod {
        return .get
    }

    var path: String {
        return "/api/ipad.hotentry?category=Popularity&of=0&limit=50"
    }

    typealias Response = [Entry]

    func response(from object: Any, urlResponse URLResponse: HTTPURLResponse) throws -> Response {
        return try decodeArray(object)
    }
}
