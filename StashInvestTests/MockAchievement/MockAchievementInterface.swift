//
//  MockAchievementInterface.swift
//  StashInvestTests
//
//  Created by Chanick Park on 1/14/21.
//

import Foundation
@testable import StashInvest

// Move to detail view
enum AchievementNavigationOptions {
    case detail(Achievement)
}

protocol MockAchievementWireframeInterface: WireframeInterface {
    // Route
    func navigate(to option: AchievementNavigationOptions)
}

protocol MockAchievementViewInterface: ViewInterface {
    // Update view
    func updateData(_ title: String)
}

protocol MockAchievementPresenterInterface: PresenterInterface {
    // Access to Achievement data
    func numberOrItems(in section: Int) -> Int
    func item(at index: Int) -> Achievement?
    func didSelectItem(at index: Int)
}

protocol MockAchievementInteractorInterface: InteractorInterface {
    // Communicate with network module
    func retrieveAchievement(_ complete: @escaping (_ error: NetworkError?) -> Void)

    // Title
    var title: String? { get }

    // Data
    var achievements: [Achievement]? { get }
}
