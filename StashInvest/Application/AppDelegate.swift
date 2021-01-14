//
//  AppDelegate.swift
//  StashInvest
//
//  Created by Chanick Park on 1/12/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Init Wireframe(Router)
        let initialController = UINavigationController()

        // navigation bar color (purple)
        initialController.navigationBar.barTintColor = UIColor(red: 105/255, green: 55/255, blue: 206/255, alpha: 1)

        // title color (white)
        initialController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        initialController.setRootWireframe(AchievementWireframe())

        self.window = UIWindow(frame: UIScreen.main.bounds)

        self.window?.rootViewController = initialController
        self.window?.makeKeyAndVisible()

        return true
    }
}
