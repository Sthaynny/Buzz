//
//  NewsAPIWorker.swift
//  Buzz
//
//  Created by Igor Costa Nascimento on 30/01/25.
//

import Foundation


enum NewsAPI{
    static let baseUrl = "https://my-json-server.typicode.com/alura-cursos/news-api"
    static var articles : String{
        return baseUrl+"/articles"
    }
}
 

class NewsAPIWorker{
    private let networkService : NetworkingService
    
    init(networkService: NetworkingService) {
        self.networkService = networkService
    }
    
    func fetchNews(completion: @escaping (Result<[Article], Error>)-> Void)  {
        guard let url = URL(string: NewsAPI.articles) else {
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
    
    func fetchNewsById(articleID: Int, completion: @escaping (Result<Article, Error>) -> Void) {
        guard let url = URL(string: NewsAPI.articles + "/\(articleID)") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        networkService.request(url: url) { (result: Result<Article, Error>) in
            switch result {
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
