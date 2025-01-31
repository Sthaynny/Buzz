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
    func presentFetchedNews(response: NewsListModel.FetchNews.Response) {
        let displayed = response.articles.map { article in
            return NewsListModel.FetchNews.ViewModel.DisplayedArticle(title: article.title, description: article.description ?? "", author: article.author, publishedAt: formatDataPlublishAt(article.publishedAt), imageUrl: article.url)
        }
        let viewModel = NewsListModel.FetchNews.ViewModel.init(displayedArticle: displayed)
        
        
    }
    
    func presnterError(error: any Error) {
        print(error.localizedDescription)
    }
    
    private func formatDataPlublishAt(_ date: Date) -> String{
        let format = DateFormatter()
        format.locale = Locale(identifier: "pt_BR")
        format.dateFormat = "d 'de' MM 'de' yyyy"
        return format.string(from: date)
    }
    
    
}
