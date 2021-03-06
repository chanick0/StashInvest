//
//  MockAchievementWireframe.swift
//  StashInvest
//
//  Created by Chanick Park on 1/14/21.

//
//  This file was generated by the 🐍 VIPER generator
//

import XCTest
@testable import StashInvest

final class MockAchievementWireframe {
    var viewController: MockAchievementViewController?

    // MARK: - Module setup -

    init() {
        let moduleViewController = MockAchievementViewController()
        let interactor = MockAchievementInteractor()
        let presenter = MockAchievementPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter

        viewController = moduleViewController
    }

    private func openDetailView(with achievement: Achievement) {
        // Open detail view
        showAlert(with: "Warning", message: "This feature is unavailable now.")
    }
}

// MARK: - AchievementWireframeInterface

extension MockAchievementWireframe: MockAchievementWireframeInterface {
    func popFromNavigationController(animated: Bool) {
        showAlert(with: "Message", message: "popFromNavigationController")
    }

    func dismiss(animated: Bool) {
        showAlert(with: "Message", message: "dismiss")
    }

    func showErrorAlert(with message: String?) {
        showAlert(with: "Error", message: message ?? "showErrorAlert")
    }

    func showAlert(with title: String?, message: String?) {
        print("\(title ?? "no title"): \(message ?? "no message")")
    }

    func showAlert(with title: String?, message: String?, actions: [UIAlertAction]) {
        showAlert(with: title, message: message)
    }

    func navigate(to option: AchievementNavigationOptions) {
        switch option {
        case .detail(let achievement):
            openDetailView(with: achievement)
        }
    }
}
