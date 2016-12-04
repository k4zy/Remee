import Foundation
import Himotoki

struct ImageInfo {
    let width: Int
    let height: Int
    let url: URL
}

extension ImageInfo: Decodable {
    static let URLTransformer = Transformer<String, URL> { (url: String) -> URL in
        if let _URL = URL(string: url) {
            return _URL
        }
        throw customError("Invalid URL string: \(url)")
    }

    static func decode(_ e: Extractor) throws -> ImageInfo {
        return try ImageInfo (
                              width: e <| "width",
                              height: e <| "height",
                              url: URLTransformer.apply(e <| "url")
        )
    }

}
