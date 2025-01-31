//
//  NewsListDetailsViewController.swift
//  Buzz
//
//  Created by Igor Costa Nascimento on 31/01/25.
//

import UIKit

protocol NewsListDetialsDisplayLogic{
    func displayedDetailsNews(viewModel: NewsListDetailsModel.FetchDetaislNews.ViewModel)
    func displayedError(messege: String)
}

class NewsListDetailsViewController: UIViewController {
    
    var articleId:Int
    var displayedArticle: NewsListDetailsModel.FetchDetaislNews.ViewModel.DisplayedDetailsNews?
    var interector: NewsListDetailsBusinessLogic?
    private lazy var articleTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22.0, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    init(articleId: Int) {
        self.articleId = articleId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primary
        setup()
        fetchDetailsNews()
        addSubviews()
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    func setup(){
        let viewController = self
        let interector = NewsListDetailsInteractor()
        let presenter = NewsListDetailsPresenter()
        viewController.interector = interector
        interector.presenter = presenter
        presenter.viewController = viewController
    }
    
    func fetchDetailsNews(){
        interector?.loadNewsFrom(id: articleId)
    }
    
    private func addSubviews() {
        view.addSubview(articleTitleLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            articleTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            articleTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            articleTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
        ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension NewsListDetailsViewController : NewsListDetialsDisplayLogic{
    
    func displayedDetailsNews(viewModel: NewsListDetailsModel.FetchDetaislNews.ViewModel)  {
        self.displayedArticle = viewModel.displayedDetailsArticle
        articleTitleLabel.text = self.displayedArticle?.title ?? ""
    }
    
    func displayedError(messege: String) {
        let alert = UIAlertController(title: "Erro", message: messege, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
    
     
}
