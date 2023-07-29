//
//  MovieTableCell.swift
//  assign
//
//  Created by 김태윤 on 2023/07/28.
//

import UIKit
class MovieTableCell: UITableViewCell{
    static let identifier = "MovieTableCell"
    @IBOutlet weak var rootView: UIView!
    @IBOutlet weak var posterImgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var runningLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    
    private func configure(){
        titleLabel.font = .boldSystemFont(ofSize: 18)
        self.contentsLabel.font = .systemFont(ofSize: 14)
        [self.scoreLabel,self.dateLabel,self.runningLabel].forEach { label in
            label?.font = .boldSystemFont(ofSize: 14)
        }
    }
    func setViewContents(data:MovieModel){
        self.configure()
        self.titleLabel.text = data.title
        self.runningLabel.text = "\(data.runtime)분"
        self.scoreLabel.text = String(format: "%.2f점", data.rate)
        self.contentsLabel.text = data.overview
        self.posterImgView.image = UIImage(named: data.title) ?? .checkmark
        self.dateLabel.text = data.releaseDate
//        let dateStr = data.date.formatted(date: .complete, time: .omitted)
    }
}
