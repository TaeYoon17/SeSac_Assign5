//
//  Case3TableVC.swift
//  assign
//
//  Created by 김태윤 on 2023/07/27.
//

import UIKit
struct ShoppingItem{
    var content:String
    var isChecked:Bool = false
    var isWant: Bool = false
}
class Case3TableVC: UITableViewController{
    static let cellIdentifier = "Case3Cell"
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var inputField: UITextField!
    var shopList:[ShoppingItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white
        topView.layer.cornerRadius = 16
        
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    @IBAction func addBtnTapped(_ sender: UIButton) {
        addItemLogic()
        self.view.endEditing(true)
    }
    @IBAction func textFieldReturned(_ sender: UITextField) {
        addItemLogic()
    }
    @IBAction func rootViewTapped(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    func addItemLogic(){
        guard let text = self.inputField.text else { return }
        shopList.append(.init(content: text, isWant: false))
        self.tableView.reloadData()
        self.inputField.text = ""
    }
}
extension Case3TableVC{
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        " "
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.shopList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Case3TableVC.cellIdentifier) else {return .init()}
        if let shopItem = shopList[safe:indexPath.row]{
            cell.textLabel?.text = shopItem.content
            cell.imageView?.image = UIImage(systemName: shopItem.isChecked ? "checkmark.square.fill": "checkmark.square")
            let image = UIImage(systemName: "star")
            image?.withTintColor(.black)
            let imageView = UIImageView(image: image)
            imageView.tintColor = .black
            cell.accessoryView = imageView
        }else{ }
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
}
