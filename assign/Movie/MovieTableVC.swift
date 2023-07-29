//
//  MovieTableVC.swift
//  assign
//
//  Created by 김태윤 on 2023/07/28.
//

import UIKit

class MovieTableVC: UITableViewController{
    let model = MovieInfo()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 128
        self.tableView.backgroundColor = .white
    }
}
extension MovieTableVC{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.movie.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableCell.identifier) as? MovieTableCell else {
            return .init()
        }
        cell.setViewContents(data: model.movie[indexPath.row])
        return cell
    }
}
