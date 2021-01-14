//
//  NetworkClient.swift
//  StashCoach
//
//  Created by Chanick Park on 1/12/21.
//  Copyright © 2020 Chanick Park. All rights reserved.
//

import Foundation

// Network Client Result
enum NetworkClientResult<Type> {
    case success(Type)
    // array of error messages
    case failure([String])
}

enum NetworkError: Error {
    case error([String])
}

enum BundleRequestError: Error {
    case invalidPath
    case invalidData
}

//
// NetworkClient
// Load from local json file
//
protocol NetworkClient {
    var path: String { get }

    // Request local json file load
    func request(path: String, complete: @escaping (NetworkClientResult<Data>) -> Void)

    // Request local json file load and decode data to T
    func request<T: Codable>(path: String, complete: @escaping (NetworkClientResult<T>) -> Void)

    // Request local json file load and decode sub data(keyPath) to T
    func request<T: Codable>(path: String, keyPath: String?, complete: @escaping (NetworkClientResult<T>) -> Void)
}
