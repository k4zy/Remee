import Foundation
import Himotoki

struct Entry {
    let count: Int
    let date: Date
    let imageL: ImageInfo?
    let eid: Int
    let description: String
    let entryUrl: String?
    let image: URL?
    let rootUrl: URL
    let url: URL
    let title: String
}

extension Entry: Decodable {
    static let IntTransformer = Transformer<String, Int> { (text: String) -> Int in
        if let int = Int(text) {
            return int
        }
        throw customError("Invalid input: \(text)")
    }

    static let DateTransformer = Transformer<String, Date> { (text: String) -> Date in
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        if let date = formatter.date(from: text) {
            return date
        }
        throw customError("Invalid input: \(text)")
    }

    static let URLTransformer = Transformer<String, URL> { (url: String) -> URL in
        if let _URL = URL(string: url) {
            return _URL
        }
        throw customError("Invalid input: \(url)")
    }

    static let OptionalURLTransformer = Transformer<String, URL?> { (url: String) -> URL? in
        return URL(string: url)
    }

    static func decode(_ e: Extractor) throws -> Entry {
        return try Entry (
                          count: IntTransformer.apply( e <| "count"),
                          date: DateTransformer.apply(e <| "date"),
                          imageL: e <|? "image_l",
                          eid: IntTransformer.apply( e <| "eid"),
                          description: e <| "description",
                          entryUrl: e <|? "entry_url",
                          image: OptionalURLTransformer.apply(e <| "image"),
                          rootUrl: URLTransformer.apply(e <| "root_url"),
                          url: URLTransformer.apply(e <| "url"),
                          title: e <| "title"
        )
    }
}
