//
//  NewsListDeatilsPresenter.swift
//  Buzz
//
//  Created by Igor Costa Nascimento on 31/01/25.
//

protocol NewsListDetailsPresentationLogic {
    func presentFetchedDetaislNews(response: NewsListDetailsModel.FetchDetaislNews.Response)
    func presnterError(error:Error)
    
}


class NewsListDetailsPresenter: NewsListDetailsPresentationLogic {
    
    var viewController: NewsListDetialsDisplayLogic?
    
    func presentFetchedDetaislNews(response: NewsListDetailsModel.FetchDetaislNews.Response) {
        let displayer = response.article
        guard let displayer else { return  }
        let viewModel = NewsListDetailsModel.FetchDetaislNews.ViewModel.init(displayedDetailsArticle: NewsListDetailsModel.FetchDetaislNews.ViewModel.DisplayedDetailsNews(title: displayer.title, description: displayer.description ?? "", author: displayer.author, publishedAt: displayer.publishedAt.formatDataPlublishAt(), imageUrl: displayer.url, content: displayer.content)
            )
        viewController?.displayedDetailsNews(viewModel: viewModel)
    }
    
    func presnterError(error: any Error) {
        print(error.localizedDescription)
        viewController?.displayedError(messege: error.localizedDescription)
    }
    
    
}
