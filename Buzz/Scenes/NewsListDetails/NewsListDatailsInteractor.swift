//
//  NewsListDeatilsInteractor.swift
//  Buzz
//
//  Created by Igor Costa Nascimento on 31/01/25.
//

import Foundation


protocol NewsListDetailsBusinessLogic{
    func loadNewsFrom(id articleId: Int)
}

protocol NewsListDetailsDataStore{
    var article: Article?{ get set}
}

class NewsListDetailsInteractor: NewsListDetailsBusinessLogic , NewsListDetailsDataStore{
    private var worker : NewsAPIWorker
    var article: Article?
    var presenter : NewsListDetailsPresentationLogic?
    
    init(worker: NewsAPIWorker = NewsAPIWorker(networkService: URLSessionNetwork( ))) {
        self.worker = worker
    }
    func loadNewsFrom(id articleId: Int) {
        worker.fetchNewsById(articleID: articleId) { [weak self] response in
            guard let self else{
                return
            }
            
            DispatchQueue.main.async {
                switch response {
                    case .success(let success):
                        self.presenter?.presentFetchedDetaislNews(response: NewsListDetailsModel.FetchDetaislNews.Response(article: success))
                        print(success)
                    case .failure(let failure):
                        self.presenter?.presnterError(error: failure)
                        print("Ocorreu um erro!")
                }
            }
        }
    }
    
    
    
    
    
}


