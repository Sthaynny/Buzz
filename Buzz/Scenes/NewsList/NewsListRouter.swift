//
//  NewsListRouter.swift
//  Buzz
//
//  Created by Igor Costa Nascimento on 30/01/25.
//

import Foundation
import UIKit

class NewsListRouter{
    static func createInitViewController() -> UIViewController{
        let newsViewController = NewsListViewController()
        let navigationController = UINavigationController(rootViewController: newsViewController)
       return  navigationController
    }
}
