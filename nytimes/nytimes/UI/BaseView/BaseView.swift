//
//  BaseView.swift
//  nytimes
//
//  Created by iOS Weeteam on 3/11/20.
//  Copyright © 2020 Dmytro Doroshchuk. All rights reserved.
//

import UIKit

class BaseView: UIViewController, AlertPresenter, ActivityIndicatorPresenter, ShareProtocol {

    private let tableView = UIFactory.TableView.tableView()
    private let reloadButton = UIFactory.button(title: "Reload content")
    private let viewModel = ViewModel()
    let activityIndicator: ActivityView = ActivityView()
    
    func downloadArticles(type: ArticleType) {
        setActivityIndicator(hidden: false)
        viewModel.getArticles(type: type) { result in
            self.setActivityIndicator(hidden: true)
            switch result {
            case .success(_):
                self.tableView.reloadData()
                self.reloadButton.isHidden = true
            case .failure(let error):
                self.showAlert(message: error)
            }
        }
    }
    
    func readDataBase() {
        viewModel.readFavorites {
            self.tableView.reloadData()
        }
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.fillSuperview()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
    }
    
    func setupButton(completion: @escaping () -> Void) {
        view.addSubview(reloadButton)
        reloadButton.anchorSize(to: self.view, multiplierWidth: 0.4, multiplierHeight: 0.1)
        reloadButton.centering(to: self.view)
        reloadButton.addAction(for: .touchUpInside) {
            completion()
        }
    }

}

extension BaseView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openLink(string: viewModel.articleList[indexPath.row].url)
    }
}

extension BaseView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier) as? TableViewCell else { return UITableViewCell() }
        cell.setupCell(text: viewModel.articleList[indexPath.row].title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.Dimensions.tableCellHeight
    }
    
}
