//
//  CircleLevelView.swift
//  StashInvest
//
//  Created by Chanick Park on 1/13/21.
//

import UIKit

class CircleLevelView: UIView {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var levelLbl: UILabel!

    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)

        loadFromXib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        loadFromXib()
    }

    fileprivate func loadFromXib() {
        Bundle.main.loadNibNamed("CircleLevelView", owner: self, options: nil)
        view.frame = self.bounds
        self.addSubview(view)

        initUI()
    }

    fileprivate func initUI() {
        // circle outline
        self.outlineCircle(bgColor: .white, borderColor: .white)
    }

    // MARK: - public

    func setupText(_ title: String, _ level: String) {
        titleLbl.text = title
        levelLbl.text = level
    }
}
