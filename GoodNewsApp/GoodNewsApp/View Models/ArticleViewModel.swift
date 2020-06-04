//
//  ArticleViewModel.swift
//  GoodNewsApp
//
//  Created by Mohammed Rishan on 28/04/20.
//  Copyright © 2020 Mohammed Rishan. All rights reserved.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
}
extension ArticleListViewModel {
    
    var numberOfSection: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
    
}

struct ArticleViewModel {
    private let article: Article
}
extension  ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}
extension ArticleViewModel {
    
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description
    }
    
    var urlToImage: URL {
        return self.article.urlToImage
    }
    
}
