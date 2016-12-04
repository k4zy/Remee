import APIKit

protocol BookmarkRequest: Request {}

extension BookmarkRequest {
    var baseURL: URL {
        return URL(string: "http://b.hatena.ne.jp")!
    }
}
