//
//  MockAchievementPresenter.swift
//  StashInvest
//
//  Created by Chanick Park on 1/14/21.

//
//  This file was generated by the 🐍 VIPER generator
//

@testable import StashInvest

final class MockAchievementPresenter {

    // MARK: - Private properties -

    private unowned let view: MockAchievementViewInterface
    private let interactor: MockAchievementInteractorInterface
    private let wireframe: MockAchievementWireframeInterface

    var achievements: [Achievement] = []

    // MARK: - Lifecycle -

    init(view: MockAchievementViewInterface, interactor: MockAchievementInteractorInterface, wireframe: MockAchievementWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension MockAchievementPresenter: MockAchievementPresenterInterface {
    func viewDidLoad() {
        // Request achievements
        interactor.retrieveAchievement { [weak self] (error) in
            guard let `self` = self else {
                return
            }
            if let error = error {
                // Show fail message popup
                self.wireframe.showErrorAlert(with: error.localizedDescription)
                return
            }

            // Update view
            self.view.updateData(self.interactor.title ?? "")
        }
    }

    func numberOrItems(in section: Int) -> Int {
        return achievements.count
    }

    func item(at index: Int) -> Achievement? {
        return achievements[safe: index]
    }

    func didSelectItem(at index: Int) {
        if let achievement = achievements[safe: index] {
            wireframe.navigate(to: .detail(achievement))
        }
    }
}
