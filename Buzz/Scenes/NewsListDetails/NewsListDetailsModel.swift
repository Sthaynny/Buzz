//
//  NewsListDeatilsModel.swift
//  Buzz
//
//  Created by Igor Costa Nascimento on 31/01/25.
//

import Foundation

struct NewsListDetailsModel {
    struct FetchDetaislNews {
        struct Request{
            let id:Int
        }
        struct Response {
            let article:Article
        }
        struct ViewModel {
            struct DisplayedDetailsNews {
                let title:String
                let description:String
                let author:String 
                let publishedAt: String
                let imageUrl:URL
                let content: String
            }
            
            let displayedDetailsArticle: DisplayedDetailsNews
        }
    }
}
