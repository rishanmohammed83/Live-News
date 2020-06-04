//
//  WebServices.swift
//  GoodNewsApp
//
//  Created by Mohammed Rishan on 28/04/20.
//  Copyright © 2020 Mohammed Rishan. All rights reserved.
//

import Foundation

class WebServices {
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
//            print(String(decoding: data!, as: UTF8.self))
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                
                if let articleList = articleList {
                    completion(articleList.articles)
                }
//                print(articleList?.articles)
                print("Success")
            }
        }.resume()
        
    }
}
