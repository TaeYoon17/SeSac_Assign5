//
//  LayoutPlayVC.swift
//  assign
//
//  Created by 김태윤 on 2023/07/26.
//

import UIKit
class LayoutPlayVC: UIViewController{
//    @IBOutlet weak var centerLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    var toggle = false
//    ㅁㅁㅁㅁ
    var idx = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    let btnText = "ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ"
    var timer: Timer?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.timer = Timer.scheduledTimer(timeInterval: 0.5,target: self,selector: #selector(goTimer(timer:)),userInfo: nil,repeats: true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.timer?.invalidate()
    }
    @objc func goTimer(timer:Timer){
        self.idx = (self.idx + 1) % 6
        var nextText = self.btnText
        for _ in 0..<(self.idx + 1){
            nextText += "ㅁ"
        }
        self.bottomLabel.text = nextText
        print(nextText)
    }

//    @IBAction func btnTapped(_ sender: UIButton) {
//        guard let text = self.centerLabel.text else {return}
//        self.centerLabel.text = text.isEmpty ? "라벨" : ""
//
//        UIView.transition(with: self.rightLabel, duration: 0.5,options:.curveLinear) {[weak self] in
//            if let toggle = self?.toggle, toggle{
//                self?.rightLabel.center.x = 0
//                self?.rightLabel.text = "하이욤"
//            }else{
//                self?.rightLabel.center.x = 0
//                self?.rightLabel.text = "긴 하이욤 하이욤 하이욤 하이욤 하이욤 하이욤"
//            }
//        }
//        toggle.toggle()
//    }

}
