//
//  MockNetworkClient.swift
//  StashInvestTests
//
//  Created by Chanick Park on 1/14/21.
//

import Foundation
@testable import StashInvest

final class MockStashNetworkClient: StashNetworkClient {
    //
    // Request load json file from Bundle
    //
    override func request(path: String, complete: @escaping (NetworkClientResult<Data>) -> Void) {
        self.path = path

        // load json file from local (StashCoachTest Resource)
        guard let url = Bundle(for: StashInvestTests.self).url(forResource: path, withExtension: "json") else {
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
}
