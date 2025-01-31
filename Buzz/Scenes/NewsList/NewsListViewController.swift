//
//  ViewController.swift
//  Buzz
//
//  Created by Igor Costa Nascimento on 30/01/25.
//

import UIKit

class NewsListViewController: UIViewController {
    
    private let interector = NewsListInterector()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        interector.loadNews()
    }


}

