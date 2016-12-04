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
//        guard let itemDicts = object as? [[String: AnyObject]] else {
//            throw ResponseError.unexpectedObject(object)
//        }
//
//        let items: [Entry] = itemDicts.map { dict in
//            let id = dict["id"] as! Int
//            let name = dict["name"] as! String
//            let desc = dict["description"] as! String
//            let price = dict["price"] as! Int
//            let imageURLString = dict["image_url"] as! String
//            let imageURL = NSURL(string: imageURLString)!
//
//            return Item(id: id, name: name, desc: desc, price: price, imageURL: imageURL)
//        }
//        
//        return items
    }
}
