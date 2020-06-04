//
//  NewsListTableViewController.swift
//  GoodNewsApp
//
//  Created by Mohammed Rishan on 28/04/20.
//  Copyright © 2020 Mohammed Rishan. All rights reserved.
//

import Foundation
import UIKit

class NewsListTableviewController: UITableViewController {
    
    var filter: String?
    
    @IBOutlet var weatherTableView: UITableView!
    
    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
       let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.placeholder = "Search Country Name"
        searchBar.tintColor = UIColor.white
        searchBar.showsCancelButton = true
        
        
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            textfield.textColor = UIColor.white
            if let backgroundview = textfield.subviews.first {

                // Background color
                backgroundview.backgroundColor = UIColor.white

                // Rounded corner
                backgroundview.layer.cornerRadius = 10;
                backgroundview.clipsToBounds = true;
            }
            filter = textfield.text
        }
        self.navigationController?.navigationBar.topItem?.titleView = searchBar
    
    }
    
    private func setup() {
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=uk&apiKey=97caf282b64e48c4b0bac6bf5965001a")!
        
        WebServices().getArticles(url: url) { (articles) in
            
            if let articles = articles {
                
                self.articleListVM = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0: self.articleListVM.numberOfSection
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not Found")
        }
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        
    DispatchQueue.main.async {
        let url = URL(string: "\(articleVM.urlToImage)")
            if let data = try? Data(contentsOf: url!)
            {
                let image: UIImage = UIImage(data: data)!
                cell.newsImage.image = image
            }
        }
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        cell.tag = indexPath.row
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "myWeather") as! DetailNewsViewController
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        let url = URL(string: "\(articleVM.urlToImage)")
        
        if let data = try? Data(contentsOf: url!) {
            let image: UIImage = UIImage(data: data)!
            detailVC.newzImage = image
        }
        detailVC.title1 = articleVM.title
        detailVC.description1 = articleVM.description
        self.navigationController?.show(detailVC, sender: self)
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}

extension NewsListTableviewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    // TODO
    
  }
}
