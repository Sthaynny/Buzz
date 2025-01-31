//
//  ViewController.swift
//  Buzz
//
//  Created by Igor Costa Nascimento on 30/01/25.
//

import UIKit

class NewsListViewController: UIViewController {
    
//    private let interector = NewsListInterector()
    private lazy var newsListTableView: UITableView = {
        let table = UITableView( )
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        return table
    }( )

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primary
//        interector.loadNews(resquest: NewsListModel.FetchNews.Request() )
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews(){
        view.addSubview(newsListTableView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            newsListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            newsListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newsListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newsListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }


}

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = "Noticia"
        cell.contentConfiguration = content
        
        return cell
    }
    
    
}

