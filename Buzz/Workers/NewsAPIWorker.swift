//
//  NewsAPIWorker.swift
//  Buzz
//
//  Created by Igor Costa Nascimento on 30/01/25.
//

import Foundation


enum NewsAPIWorker{
    static let baseUrl = "https://my-json-server.typicode.com/alura-cursos/news-api"
    static var articles : String{
        return baseUrl+"/articles"
    }
}
 

class NetworkAPIWorker{
    private let networkService : NetworkingService
    
    init(networkService: NetworkingService) {
        self.networkService = networkService
    }
    
    func fetchNews(completion: @escaping (Result<[Article], Error>)-> Void)  {
        guard let url = URL(string: NewsAPIWorker.articles) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        networkService.request(url: url) { (response: Result<[Article], Error>) in
            switch response {
                case .success(let result):
                    completion(.success(result))
                case .failure(let failure):
                    completion(.failure(failure))
            }
        }
    }
}
