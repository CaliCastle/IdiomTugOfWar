//
//  APIClient.swift
//  IdiomTugOfWar
//
//  Created by Cali Castle on 19/09/2016.
//  Copyright © 2016 Cali Castle. All rights reserved.
//

import Foundation

class APIClient {

    /// Shared singleton
    static let shared = APIClient()

    let baseUrl = Credential.apiBaseUrl
    let key = Credential.apiKey

    /// Prevent from calling init method publicly.
    private init() {}

    /// Send request to check the validity.
    ///
    /// - parameter keyword:  Query keyword.
    /// - parameter callback: Called once the response is received.
    func request(for keyword: String, then callback: @escaping (Bool) -> Void) {
        DispatchQueue.global().async {
            self.getResponse(self.baseUrl, "chengyu=" + keyword) {
                (data, response, error) in
                if error == nil {
                    if let result = convertStringToDictionary(text: String(data: data!, encoding: .utf8)!) {
                        if result["status"] as? String == "0" {
                            // It is an idiom.
                            callback(true)
                        } else {
                            // It is NOT.
                            callback(false)
                        }
                    }
                }
            }
        }
    }

    /// Perform a "GET" request to the specific URL.
    ///
    /// - parameter url:      Request URL.
    /// - parameter arg:      Request argument.
    /// - parameter callback: Called when we get a response.
    func getResponse(_ url: String, _ arg: String, _ callback: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let requestUrl = (url + "?" + arg).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!

        var request = URLRequest(url: URL(string: requestUrl)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 10)

        request.httpMethod = "GET"
        request.addValue(key, forHTTPHeaderField: "apikey")

        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            callback(data, response, error)
        }.resume()
    }
}
