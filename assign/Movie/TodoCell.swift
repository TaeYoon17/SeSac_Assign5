//
//  TodoCell.swift
//  assign
//
//  Created by 김태윤 on 2023/07/29.
//

import UIKit

class TodoCell:UITableViewCell{
    static let identifier = "TodoCell"
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favoriteBtn: UIButton!
    private var isChecked = false{
        didSet{
            if isChecked != oldValue{
                checkBtn.toggleDesign(value: isChecked, imgString: "checkmark.square")
            }
        }
    }
    private var isFavorite = false{
        didSet{
            if isFavorite != oldValue{
                favoriteBtn.toggleDesign(value: isFavorite, imgString: "star")
            }
        }
    }
    private func configure(){
        checkBtn.toggleDesign(value: isChecked, imgString: "checkmark.square")
        favoriteBtn.toggleDesign(value: isFavorite, imgString: "star")
    }
    func setCell(data:TodoModel){
        self.configure()
        self.titleLabel.text = data.title
        self.isChecked = data.isCheckd
        self.isFavorite = data.isDone
    }
    @IBAction func checkBtnTapped(_ sender: UIButton) { self.isChecked.toggle() }
    @IBAction func favoriteBtnTapped(_ sender: UIButton) { self.isFavorite.toggle() }
}


fileprivate extension UIButton{
    func toggleDesign(value:Bool,imgString:String){
        self.setImage(.init(systemName: "\(imgString)\(value ? ".fill" : "")"), for: .normal)
        self.setPreferredSymbolConfiguration(.init(scale: .large), forImageIn: .normal)
    }
}
