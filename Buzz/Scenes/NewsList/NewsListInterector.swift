//
//  NewaListInterector.swift
//  Buzz
//
//  Created by Igor Costa Nascimento on 30/01/25.
//

import Foundation

protocol NewsListBusinessLogic {
    func loadNews(resquest : NewsListModel.FetchNews.Request)
}

protocol NewsListDataStore {
    var articles: [Article] {get set }
}

class NewsListInterector: NewsListDataStore, NewsListBusinessLogic{
    private var worker : NewsAPIWorker
      var articles : [Article] = []
    
    var presenter: NewsListPresentationLogic?
    
    init(worker: NewsAPIWorker = NewsAPIWorker(networkService: URLSessionNetwork( ))) {
        self.worker = worker
    }
    
    func loadNews(resquest : NewsListModel.FetchNews.Request){
        worker.fetchNews { [weak self] result in
            guard let self else {
                return
            }
            DispatchQueue.main.async {
                switch result {
                    case .success(let success):
                        self.articles = success
                        let response = NewsListModel.FetchNews.Response(articles: success)
                        self.presenter?.presentFetchedNews(response: response)
                        print(success)
                    case .failure(let failure):
                        print("Ocorreu um erro ao obter a lista de noticias: \(failure.localizedDescription)")
                        self.presenter?.presnterError(error: failure)
                }
            }
        }
    }
}
