# StashInvest

## Class Diagram(VIPER)
![Diagram](https://raw.github.com/chanick0/StashInvest/main/docs/viper.png)

## Interface Protocols
```Swift
protocol AchievementWireframeInterface: WireframeInterface {
    // Route
    func navigate(to option: AchievementNavigationOptions)
}

protocol AchievementViewInterface: ViewInterface {
    // Update view
    func updateData(_ title: String)
}

protocol AchievementPresenterInterface: PresenterInterface {
    // Access to Achievement data
    func numberOrItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> Achievement?
    func didSelectItem(at indexPath: IndexPath)
}

protocol AchievementInteractorInterface: InteractorInterface {
    // Communicate with network module
    func retrieveAchievement(_ complete: @escaping (_ error: NetworkError?) -> Void)

    // Title
    var title: String? { get }

    // Data
    var achievements: [Achievement]? { get }
}
```
