//
//  StatisticsVC.swift
//  assign
//
//  Created by 김태윤 on 2023/07/26.
//

import UIKit

class StatisticsVC: UIViewController{
    @IBOutlet var scoreLabels: [UILabel]!
    
    @IBOutlet weak var staticStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("StatisticsVC \(#function)")
        configure()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("StatisticsVC \(#function)")
        scoreLabels.forEach { label in
            let emotionType = EmotionType(rawValue: label.tag)
            guard let keyStr = emotionType?.myKorean else {return}
            label.text = "\(UserDefaults.standard.integer(forKey: keyStr)) 번"
        }
    }
    func configure(){
        staticStackView.subviews.forEach{
            $0.layer.cornerRadius = 8
        }
        self.scoreLabels.forEach { label in
            label.font = .boldSystemFont(ofSize: 24)
            
        }
    }
}
