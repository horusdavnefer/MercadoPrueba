//
//  URLProtocolMock.swift
//  MercadoPruebaTests
//
//  Created by iMac on 25/03/24.
//

import Foundation
class URLProtocolMock: URLProtocol {
    static var testUrl = [URL?: Data]()
    static var response: URLResponse?
    static var error: Error?

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        if let url = request.url {
            if let data = URLProtocolMock.testUrl[url] {
                self.client?.urlProtocol(self, didLoad: data)
            }
        }

        if let response = URLProtocolMock.response {
            self.client?.urlProtocol(self,
                                     didReceive: response,
                                     cacheStoragePolicy: .notAllowed)
        }

        if let error = URLProtocolMock.error {
            self.client?.urlProtocol(self, didFailWithError: error)
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {}
}
