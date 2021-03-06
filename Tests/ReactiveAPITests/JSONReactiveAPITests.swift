import XCTest
import RxSwift
@testable import ReactiveAPI

class JSONReactiveAPITests: XCTestCase {
    private let session = URLSession(configuration: URLSessionConfiguration.default)

    private var api: ReactiveAPI {
        return ReactiveAPI(session: session.rx,
                           baseUrl: Resources.baseUrl)
    }

    func test_Init_JSONReactiveAPI() {
        XCTAssertEqual(api.session.base, session)
        XCTAssertNotNil(api.decoder)
    }

    func test_AbsoluteURL_AppendsEndpoint() {
        let url = api.absoluteURL("path")
        XCTAssertEqual(url.absoluteString, "http://www.mock.com/path")
    }

    func test_AbsoluteURL_AppendsEmptyEndpoint() {
        let url = api.absoluteURL("")
        XCTAssertEqual(url.absoluteString, "http://www.mock.com/")
    }
}
