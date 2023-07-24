//
//  ViewController.swift
//  assign
//
//  Created by 김태윤 on 2023/07/24.
//

import UIKit
//하이욤
class BoardVC: UIViewController {
    @IBOutlet weak var inputBoxView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var boardLabel: UILabel!
    @IBOutlet weak var colorBtn: UIButton!
    var outputText:String? = ""{
        didSet{
            print(outputText)
            if let outputText, outputText.count > 1{
                self.boardLabel.backgroundColor = .clear
                self.boardLabel.text = outputText
                setColor(color: .getRandomColor)
            }else{
                self.boardLabel.text = "정보를 입력해주세요!!"
                self.boardLabel.backgroundColor = .white
                self.textField.text = ""
                setColor(color: .black)
            }
        }
    }
    var hiddenBoxView:Bool = false{
        didSet{
            if self.hiddenBoxView{
                UIView.animate(withDuration: 0.2) {[weak self] in
                    guard let self = self else {return}
                    self.inputBoxView.layer.opacity = 0
                    self.inputBoxView.transform = CGAffineTransform(translationX: 0, y: -80)
                }completion: {[weak self]_ in
                    guard let self = self else {return}
                    self.inputBoxView.isHidden = self.hiddenBoxView
                }
            }else{
                UIView.animate(withDuration: 0.2) {[weak self] in
                    guard let self = self else {return}
                    self.inputBoxView.isHidden = self.hiddenBoxView
                    self.inputBoxView.transform = CGAffineTransform(translationX: 0, y: 0)
                    self.inputBoxView.layer.opacity = 1
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure()
    }
    @IBAction func rootLongTapped(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began{
            view.endEditing(true)
            self.hiddenBoxView.toggle()
//            self.inputBoxView.isHidden.toggle()
        }
    }
    
    @IBAction func rootViewTapped(_ sender: UITapGestureRecognizer) {
        print(#function)
//        print(sender.)
        print(sender.numberOfTapsRequired)
        if textField.isEditing{
            view.endEditing(true)
        }else{
            if !self.inputBoxView.isHidden{
//                self.inputBoxView.isHidden = true
                self.hiddenBoxView = true
            }else{
                self.view.backgroundColor = .getRandomColor
            }
        }
    }
    @IBAction func inputBtnTapped(_ sender: UIButton) {
        outputText = self.textField.text
        view.endEditing(true)
    }
    
    @IBAction func returnTapped(_ sender: UITextField) {
        print("리턴합니다!!")
        outputText = self.textField.text
//        self.inputBoxView.isHidden = true
        self.hiddenBoxView = true
    }
    @IBAction func convertColorBtnTapped(_ sender: UIButton) {
        print(#function)
        view.endEditing(true)
        let vc = UIAlertController(title: "색상을 선택하세요", message: nil, preferredStyle: .actionSheet)
        [("빨간색",.red),("초록색",UIColor.green),("파란색",.blue),("랜덤색",.getRandomColor)].forEach {[weak self] (title,color) in
            let alert = UIAlertAction(title: title, style: .default){[weak self] _ in
                self?.setColor(color: color)
            }
            vc.addAction(alert)
        }
        vc.addAction(.init(title: "취소", style: .cancel))
        present(vc, animated: true)
        
    }
    func configure(){ //초기설정
        self.view.backgroundColor = .getRandomColor
        self.textField.placeholder = "표시할 정보를 입력하세요"
        outputText = nil
        self.setColor(color: .black)
        self.inputBoxView.layer.cornerRadius = 8
    }
    func setColor(color:UIColor){
        if let text = self.outputText, text.count > 1{
            self.boardLabel.textColor = color
        }else{
            self.boardLabel.textColor = .black
        }
        self.colorBtn.configuration?.baseForegroundColor = color
    }
}
extension UIColor{
    static var getRandomColor:UIColor{
        UIColor(cgColor: .init(red: .random(in: 0...1),green: .random(in: 0...1),blue: .random(in: 0...1),alpha: 1))
    }
}
