//
//  Case2TableVC.swift
//  assign
//
//  Created by 김태윤 on 2023/07/27.
//

import Foundation
import UIKit

enum Case2Type:Int, CaseIterable{
    case entire
    case personal
    case etc
    var korean:String{
        get{
            switch self{
            case .entire: return "전체 설정"
            case .personal: return "개인 설정"
            case .etc: return "기타"
            }
        }
    }
}
let case2Model = [
    Case2Type.entire: ["공지사항","실험실","버전 정보"],
    .personal: ["개인/보안","알림","채팅","멀티프로필"],
    .etc: ["고객센터/도움말"]
]

class Case2TableVC: UITableViewController{
    static let cellIdentifier = "Case2TableVC_Cell"
    let model = case2Model
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        model.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let type = Case2Type(rawValue: section) else { return nil}
        return type.korean
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let type = Case2Type(rawValue: section),let num = model[type]?.count else {
            print("찾기 실패")
            return 0
        }
        return num
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Case2TableVC.cellIdentifier) else {return .init()}
        guard let sectionType = Case2Type(rawValue: indexPath.section), let value = model[sectionType]?[indexPath.row] else {
            print("셀이 초과된듯..?")
            return .init()
        }
        cell.textLabel?.text = value
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
}
