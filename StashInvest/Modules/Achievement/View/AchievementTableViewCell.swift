//
//  AchievementTableViewCell.swift
//  StashInvest
//
//  Created by Chanick Park on 1/12/21.
//

import UIKit
import SDWebImage

class AchievementTableViewCell: UITableViewCell {
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var circelLevelView: CircleLevelView!
    @IBOutlet weak var progressBarView: UIProgressView!
    @IBOutlet weak var currPointLabel: UILabel!
    @IBOutlet weak var totalPointLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        // Init UI
        initUI()
    }

    fileprivate func initUI() {
        // Set corner radius
        bgImageView.outline(bgColor: .clear, borderColor: .clear, radius: 10)
        shadowView.shadow(radius: 10)

        // rounded progress bar
        progressBarView.layer.cornerRadius = 5
        progressBarView.clipsToBounds = true
        progressBarView.layer.sublayers?[safe: 1]?.cornerRadius = 5
        progressBarView.subviews[safe: 1]?.clipsToBounds = true

        // set selected bg color to none (clear)
        let view = UIView()
        view.backgroundColor = UIColor.clear
        selectedBackgroundView = view
    }

    // MARK: - setup
    func configure(level: String, achievementPoint: Int, totalPoint: Int, imageURL: URL?) {
        // Generate random color image for placeholder
        let placeHolder = UIColor.random.image()

        if let imageURL = imageURL {
            // Using SDWebImage lib for downloading image asynchronous and cached.
            bgImageView.sd_setImage(with: imageURL, placeholderImage: placeHolder, options: [], completed: nil)
        } else {
            bgImageView.image = placeHolder
        }

        // Set circle label
        circelLevelView.setupText("Level", level)

        progressBarView.progress = Float(achievementPoint) / Float(totalPoint)

        currPointLabel.text = "\(achievementPoint)pts"
        totalPointLbl.text = "\(totalPoint)pts"
    }
}
