//
//  MockAchievementNetworkManager.swift
//  StashInvestTests
//
//  Created by Chanick Park on 1/14/21.
//

import Foundation
@testable import StashInvest

final class MockAchievementNetworkManager: MockNetworkManager {
    var client: NetworkClient
    var path: String = "achievementsTest"

    init(client: NetworkClient) {
        self.client = client
    }

    //
    // Retrieve Achievement List
    //
    func retrieveAchievementList(_ complate: AchievementListCompletionBlock?) {
        client.request(path: path) { (result) in
            switch result {
            // success
            case .success(let data):
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        // Load title, achievements
                        guard let overview = json["overview"] as? [String: Any],
                              let title = overview["title"] as? String,
                              let achievementsJson = json["achievements"] else {
                                complate?("", .failure([BundleRequestError.invalidData.localizedDescription]))
                                return
                        }

                        // sub data to json
                        let achievementData = try JSONSerialization.data(withJSONObject: achievementsJson, options: .prettyPrinted)
                        let achievements = try JSONDecoder().decode([Achievement].self, from: achievementData)

                        complate?(title, .success(achievements))
                    }
                } catch let error {
                    complate?("", .failure([error.localizedDescription]))
                }
            // Failure
            case .failure(let error):
                complate?("", .failure(error))
            }
        }
    }
}
