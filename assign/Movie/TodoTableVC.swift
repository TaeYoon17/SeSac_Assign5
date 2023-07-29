//
//  TodoTableVC.swift
//  assign
//
//  Created by 김태윤 on 2023/07/29.
//

import UIKit


class TodoTableVC: UITableViewController{
    @IBOutlet weak var textField: UITextField!
    var todos:[TodoModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        designConfigure()
    }
    @IBAction func textFieldTapped(_ sender: UITextField) {
        addTodoItem()
    }
    @IBAction func addBtnTapped(_ sender: UIButton) {
        addTodoItem()
    }

    @IBAction func rootTableViewTapped(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    func addTodoItem(){
        guard let text = self.textField.text else { return }
        todos.append(.init(title: text, isCheckd: false, isDone: false))
        self.tableView.reloadData()
        self.view.endEditing(true)
        self.textField.text = ""
    }
    func designConfigure(){
        self.tableView.rowHeight = 52
        self.tableView.backgroundColor = .white
        textField.setValue(UIColor.lightGray, forKeyPath: "placeholderLabel.textColor")
    }
}


extension TodoTableVC{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.todos.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoCell.identifier) as? TodoCell else{
            return .init()
        }
        cell.setCell(data: todos[indexPath.row])
        return cell
    }
}
