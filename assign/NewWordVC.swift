//
//  NewWordVC.swift
//  assign
//
//  Created by 김태윤 on 2023/07/24.
//

import Foundation
import UIKit
class NewWordVC: UIViewController{
    let dummies = dummyModel
    let emptyText = "찾으시는 신조어는 없어요 ^^"
    let requireText = "찾으시는 신조어를 입력해주세요 ^~^"
    @IBOutlet var relatedBtns: [UIButton]!
    @IBOutlet var boxViews: [UIView]!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var searchField: UITextField!
    @IBOutlet var searchBtn: UIButton!
    var relatedTexts:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        hiddenRelated()
    }
    
    @IBAction func rootViewTapped(_ sender: UITapGestureRecognizer) {
        self.endEditing()
    }
    @IBAction func returnTapped(_ sender: UITextField) {
        guard let text = searchField.text else { return }
        searching(text: text)
    }
    @IBAction func searchBtnTapped(_ sender: UIButton) {
        self.endEditing()
        guard let text = searchField.text else {
            return
        }
        searching(text: text)
    }
    @IBAction func relatedBtnTapped(_ sender: UIButton) {
        let text = relatedTexts[sender.tag]
//        guard let text = sender.titleLabel?.text else { return }
        searching(text: text)
    }
    func endEditing(){
        self.view.endEditing(true)
    }
    func searching(text: String){
        guard text.count > 1 else {
            showWarning()
            return
        }
        let contentData:CoinedModel? = dummies.reduce(nil, { (partialResult, result) in
            let (_ , value) = result
            guard partialResult == nil else { return partialResult }
            if let model = value.first(where: {$0.name == text }){ return model }
            else{ return nil }
        })
        guard let contentData = contentData else {
            self.contentLabel.text = self.emptyText
            hiddenRelated()
            self.relatedTexts.removeAll()
            return
        }
        self.contentLabel.text = contentData.content
        if self.searchField.text != contentData.content{
            self.searchField.text = contentData.name
        }
        setRelatedTexts(nowType: contentData.type, nowName: contentData.name)
    }
    func setRelatedTexts(nowType:CoinedType,nowName:String){
        hiddenRelated()
        guard let datas = dummies[nowType]?.shuffled().filter({ $0.name != nowName })
        else {return}
        let maxCnt = 4 > datas.count ? datas.count : 4
        for i in 0...maxCnt{
            let btn: UIButton = relatedBtns[i]
            btn.setTitle(datas[i].name, for: .normal)
            btn.isHidden = false
            btn.tag = i + 1
            self.relatedTexts.append(datas[i].name)
        }
    }
    func hiddenRelated(){
        relatedBtns.forEach { $0.isHidden = true }
    }
}
//MARK: -- 구성
extension NewWordVC{
    func configure(){
        boxViews.forEach { $0.layer.borderColor = UIColor.black.cgColor
            $0.layer.borderWidth = 2
        }
        // 검색 버튼
        if #available(iOS 15.0, *) {
            var btnConfig = UIButton.Configuration.filled()
            btnConfig.baseBackgroundColor = .black
            btnConfig.baseForegroundColor = .white
            self.searchBtn.tintColor = .white
            self.searchBtn.configuration = btnConfig
            self.searchBtn.setImage(.init(systemName: "magnifyingglass"), for: .normal)
        }
        // 검색어 영역
        self.searchField.placeholder = "신조어를 입력하세요"
        contentLabel.textAlignment = .center
        // 라벨 글자
        self.contentLabel.text = requireText
        // 연관 검색어 버튼 스타일
        var config = UIButton.Configuration.bordered()
        config.baseBackgroundColor = UIColor.clear
        config.baseForegroundColor = UIColor.black
        config.background.strokeColor = .black
        config.background.strokeWidth = 2
        config.buttonSize = .small
        config.cornerStyle = .medium
        relatedBtns.forEach{ btn in
                btn.configuration = config
                btn.tintColor = .black
        }
    }
}
//MARK: -- 위험 띄우기
extension NewWordVC{
    func showWarning(){
        let vc = UIAlertController(title: "글을 입력하세요", message: "혼나고 싶어?", preferredStyle: .alert)
        vc.addAction(.init(title: "확인...", style: .cancel))
        hiddenRelated()
        relatedTexts.removeAll()
        self.contentLabel.text = requireText
        present(vc, animated: true)
    }
}
