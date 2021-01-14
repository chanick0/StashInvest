//
//  AchievementViewController.swift
//  StashInvest
//
//  Created by Chanick Park on 1/12/21.

//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class AchievementViewController: UIViewController {

    // MARK: - Public properties -
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
        }
    }
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var presenter: AchievementPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.startAnimating()

        // Request achievements
        presenter.viewDidLoad()
    }
}

// MARK: - Extensions -

extension AchievementViewController: AchievementViewInterface {
    // update Achievement Data
    func updateData(_ title: String) {
        activityIndicator.stopAnimating()

        self.title = title
        tableView.reloadData()
    }
}

// MARK: - TableViewDelegate, TableViewDataSource

extension AchievementViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectItem(at: indexPath)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // ratio: 1 : 0.6
        return tableView.frame.width * 0.6
    }
}

extension AchievementViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOrItems(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AchievementTableViewCell", for: indexPath) as! AchievementTableViewCell

        if let achievement = presenter.item(at: indexPath) {
            cell.configure(level: achievement.level,
                           achievementPoint: achievement.progress,
                           totalPoint: achievement.total,
                           imageURL: achievement.bgImageURL)
        }

        return cell
    }
}