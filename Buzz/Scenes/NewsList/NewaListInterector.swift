//
//  NewaListInterector.swift
//  Buzz
//
//  Created by Igor Costa Nascimento on 30/01/25.
//

import Foundation



class NewsListInterector{
    private var worker : NewsAPIWorker
    private var articles : [Article] = []
    
    init(worker: NewsAPIWorker = NewsAPIWorker(networkService: URLSessionNetwork( ))) {
        self.worker = worker
    }
    
    func loadNews(){
        worker.fetchNews { [weak self] result in
            guard let self else {
                return
            }
            DispatchQueue.main.async {
                switch result {
                    case .success(let success):
                        self.articles = success
                        print(success)
                    case .failure(let failure):
                        print("Ocorreu um erro ao obter a lista de noticias: \(failure.localizedDescription)")
                }
            }
        }
    }
}
