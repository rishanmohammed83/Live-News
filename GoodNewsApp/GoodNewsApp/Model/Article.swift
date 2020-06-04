//
//  Article.swift
//  GoodNewsApp
//
//  Created by Mohammed Rishan on 28/04/20.
//  Copyright © 2020 Mohammed Rishan. All rights reserved.
//

import Foundation

struct ArticleList: Decodable {
    
    let articles: [Article]
    
}

struct Article: Decodable {
    
    let title: String
    let description: String
    let urlToImage: URL
    
}
