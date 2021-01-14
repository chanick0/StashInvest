//
//  StashNetworkClient.swift
//  StashCoach
//
//  Created by Chanick Park on 1/12/21.
//  Copyright © 2020 Chanick Park. All rights reserved.
//

import Foundation

class StashNetworkClient: NetworkClient {
    var path: String = ""

    //
    // Request load json file from Bundle
    //
    func request(path: String, complete: @escaping (NetworkClientResult<Data>) -> Void) {
        self.path = path

        // load json file from local
        guard let url = Bundle.main.url(forResource: path, withExtension: "json") else {
            complete(.failure([BundleRequestError.invalidPath.localizedDescription]))
            return
        }
        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            complete(.success(data))
        } catch {
            // handle error
            complete(.failure([BundleRequestError.invalidData.localizedDescription]))
        }
    }

    //
    // Request load json file from Bundle, Decode to Specific type
    //
    func request<T>(path: String, complete: @escaping (NetworkClientResult<T>) -> Void) where T: Decodable, T: Encodable {
        request(path: path) { (result) in
            switch result {
            case .success(let data):
                do {
                    let codable = try JSONDecoder().decode(T.self, from: data)
                    complete(.success(codable))
                } catch {
                    // handle error
                    complete(.failure([BundleRequestError.invalidData.localizedDescription]))
                }

            case .failure(let error):
                complete(.failure(error))
            }
        }
    }

    //
    // Request load json file from Bundle, Decode sub part to Specific type
    //
    func request<T>(path: String, keyPath: String?, complete: @escaping (NetworkClientResult<T>) -> Void) where T: Decodable, T: Encodable {
        request(path: path) { (result) in
            switch result {
            case .success(let data):
                do {
                    var nestedData = data

                    // Find sub data
                    if let keyPath = keyPath,
                       let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {

                        // sub data to json
                        if let nestedJson = json[keyPath] {
                            nestedData = try JSONSerialization.data(withJSONObject: nestedJson, options: .prettyPrinted)
                        }
                    }

                    let codable = try JSONDecoder().decode(T.self, from: nestedData)
                    complete(.success(codable))
                } catch let error {
                    complete(.failure([error.localizedDescription]))
                }
            case .failure(let error):
                complete(.failure(error))
            }
        }
    }
}
