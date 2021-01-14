//
//  AchievementNetworkManager.swift
//  StashInvest
//
//  Created by Chanick Park on 1/13/21.
//

import Foundation

//
// AchievementNetworkManager
// Request Achievement List
//
typealias AchievementListCompletionBlock = (_ title: String, _ result: NetworkClientResult<[Achievement]>) -> Void

//
// AchievementNetworkManager
// Load from local data
//
struct AchievementNetworkManager: NetworkManager {
    var path: String = "achievements"
    let client: NetworkClient

    init(client: NetworkClient) {
        self.client = client
    }

    //
    // Retrieve Achievement List
    //
    func retrieveAchievementList(_ complate: AchievementListCompletionBlock?) {
        // Request data
        client.request(path: path) { (result) in
            switch result {
            // Success
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

                        // Sub data Array to [Achievement]
                        let achievementData = try JSONSerialization.data(withJSONObject: achievementsJson, options: .prettyPrinted)
                        let achievements = try JSONDecoder().decode([Achievement].self, from: achievementData)

                        complate?(title, .success(achievements))
                    }
                } catch let error {
                    // Load Error
                    complate?("", .failure([error.localizedDescription]))
                }

            // Failure
            case .failure(let error):
                complate?("", .failure(error))
            }
        }
    }

}
