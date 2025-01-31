//
//  NewsLiestPresenter.swift
//  Buzz
//
//  Created by Igor Costa Nascimento on 30/01/25.
//

import Foundation

protocol NewsListPresentationLogic {
    func presentFetchedNews(response: NewsListModel.FetchNews.Response)
    func presnterError(error:Error)
    
}

class NewsListPresenter : NewsListPresentationLogic
{
    
    weak var viewController: NewsListDisplayLogic?
    func presentFetchedNews(response: NewsListModel.FetchNews.Response) {
        let displayed = response.articles.map { article in
            return NewsListModel.FetchNews.ViewModel.DisplayedArticle(id: article.id, title: article.title, description: article.description ?? "", author: article.author, publishedAt:  article.publishedAt.formatDataPlublishAt(), imageUrl: article.url)
        }
        let viewModel = NewsListModel.FetchNews.ViewModel.init(displayedArticle: displayed)
        
        viewController?.displayFetchedNews(viewModel: viewModel)
    }
    
    func presnterError(error: any Error) {
        print(error.localizedDescription)
        viewController?.displayError(messege: error.localizedDescription)
    }
    
    
}
