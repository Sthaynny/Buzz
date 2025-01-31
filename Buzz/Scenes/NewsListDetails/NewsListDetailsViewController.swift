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
    }
    
    func displayedError(messege: String) {
        let alert = UIAlertController(title: "Erro", message: messege, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
    
     
}
