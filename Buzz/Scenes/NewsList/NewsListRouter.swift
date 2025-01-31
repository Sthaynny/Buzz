//
//  NewsListRouter.swift
//  Buzz
//
//  Created by Igor Costa Nascimento on 30/01/25.
//

import Foundation
import UIKit

protocol NewsListRoutingLogic {
    var viewController : NewsListViewController? { get set}
    func routeToNewsDetails(articleId: Int)
}

class NewsListRouter : NewsListRoutingLogic{
    var viewController: NewsListViewController?
    
    func routeToNewsDetails(articleId: Int) {
        let detailsVC = NewsListDetailsViewController(articleId: articleId)
        viewController?.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    static func createInitViewController() -> UIViewController{
        let newsViewController = NewsListViewController()
        let navigationController = UINavigationController(rootViewController: newsViewController)
       return  navigationController
    }
     
}
