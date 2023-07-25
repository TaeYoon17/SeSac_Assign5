//
//  MainVC.swift
//  assign
//
//  Created by 김태윤 on 2023/07/25.
//

import Foundation
import UIKit
class MainVC: UIViewController{
    @IBOutlet weak var testBtn: UIButton!
    @IBOutlet weak var emotionStack: UIStackView!
    var emotionStatus = Array(repeating: 0, count: EmotionType.allCases.count)
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    @IBAction func btnTapped(_ sender: UIButton) {
        guard let nowEmotion = EmotionType(rawValue: sender.tag) else { return }
        emotionStatus[nowEmotion.rawValue] += 1
        printOut(nowEmotion: nowEmotion)
    }
    func configure(){
        guard let btns = emotionStack.subviews as? [UIButton] else { return }
        btns.forEach { btn in
            var scoreActions:[UIMenuElement] = [1,3,5].map { num in
                UIAction(title: "Plus \(num)") {[weak self] _ in
                    guard let nowEmotion = EmotionType(rawValue: btn.tag) else {
                        print("원하는 감정 타입을 찾을 수 없음")
                        return
                    }
                    self?.emotionStatus[nowEmotion.rawValue] += num
                    self?.printOut(nowEmotion: nowEmotion)
                }
            }
            scoreActions.append(UIAction(title: "취소", attributes: .destructive, handler: { _ in print("취소") }))
            let btnMenu = UIMenu(title: "감정 파워 메뉴",children: scoreActions)
            btn.menu = btnMenu
        }
    }
    func printOut(nowEmotion: EmotionType){
        switch nowEmotion{
        case .SuperHappy: print("SuperHappy Button 횟수",terminator: ": ")
        case .Happy: print("Happy Button 횟수",terminator: ": ")
        case .Normal: print("Normal Button 횟수",terminator: ": ")
        case .Cloudy: print("Cloudy Button 횟수",terminator: ": ")
        case .SuperCloudy: print("SuperCloudy 횟수",terminator: ": ")
        }
        print(emotionStatus[nowEmotion.rawValue])
    }
}
