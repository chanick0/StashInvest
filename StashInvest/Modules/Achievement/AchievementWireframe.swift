//
//  AchievementWireframe.swift
//  StashInvest
//
//  Created by Chanick Park on 1/12/21.

//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class AchievementWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Achievement", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: AchievementViewController.self)
        super.init(viewController: moduleViewController)

        let interactor = AchievementInteractor()
        let presenter = AchievementPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

    private func openDetailView(with achievement: Achievement) {
        // Open detail view
        // navigationController?.pushWireframe(AchievementDetailWireframe(achievement))

        showAlert(with: "Warning", message: "This feature is unavailable now.")
    }
}

// MARK: - AchievementWireframeInterface

extension AchievementWireframe: AchievementWireframeInterface {
    func navigate(to option: AchievementNavigationOptions) {
        switch option {
        case .detail(let achievement):
            openDetailView(with: achievement)
        }
    }
}
