//
//  ViewController.swift
//  Buzz
//
//  Created by Igor Costa Nascimento on 30/01/25.
//

import UIKit

protocol NewsListDisplayLogic: AnyObject{
    func displayFetchedNews( viewModel: NewsListModel.FetchNews.ViewModel)
    func displayError(messege: String)
}

class NewsListViewController: UIViewController {
    
    var interector:NewsListBusinessLogic?
    var displayedArticle: [ NewsListModel.FetchNews.ViewModel.DisplayedArticle] = [ ]
    
    private lazy var newsListTableView: UITableView = {
        let table = UITableView( )
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(NewsListArticleCell.self, forCellReuseIdentifier: NewsListArticleCell.identifier)
        return table
    }( )

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primary
        setup()
        fetchNews()
        addSubviews()
        setupConstraints()
    }
    
    private func setup( ){
        let viewController = self
        let interactor = NewsListInterector()
        let presenter = NewsListPresenter()
        viewController.interector = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    private func fetchNews( ){
        interector?.loadNews(resquest: NewsListModel.FetchNews.Request())
        
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
        return displayedArticle.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let article = displayedArticle[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsListArticleCell.identifier, for: indexPath) as? NewsListArticleCell else { return UITableViewCell() }
        cell.configure(with: article)
        return cell
    }
    
    
}



extension NewsListViewController: NewsListDisplayLogic{
    func displayFetchedNews(viewModel: NewsListModel.FetchNews.ViewModel) {
        self.displayedArticle = viewModel.displayedArticle
        newsListTableView.reloadData()
    }
    
    func displayError(messege: String) {
        let alert = UIAlertController(title: "Erro", message: messege, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
    
    
}
