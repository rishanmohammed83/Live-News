//
//  DownloadTableViewController.swift
//  GoodNewsApp
//
//  Created by Mohammed Rishan on 02/06/20.
//  Copyright © 2020 Mohammed Rishan. All rights reserved.
//

import UIKit
import CoreData

class DownloadTableViewController: UITableViewController {
    
    var window: UIWindow?
    var item :[Any] = []
    var dict = NSMutableDictionary()
    
    @IBOutlet var downloadTableView: UITableView!
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    var downloadTitle: String?
    var downloadDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchdata()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.downloadTableView.reloadData()

    }
    
    func fetchdata(){
        
        let context = appdelegate.persistentContainer.viewContext
        var locations = [News]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "News")
        fetchRequest.returnsObjectsAsFaults = false
        locations = try! context.fetch(fetchRequest) as! [News]
        for location in locations {
            item.append(location)
            // item is your array
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return item.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "downloadCell", for: indexPath) as! DownloadTableViewCell
        
        let dic = item[indexPath.row] as! NSManagedObject
        
        if let image: Data = try? dic.value(forKey: "newImage") as? Data {
        cell.downloadNewsImage.image = UIImage(data: image)
        }else{
            cell.downloadNewsImage.image = nil
        }
        
        cell.downloadTitle.text = dic.value(forKey: "title") as? String
        cell.dowloadDescrption.text = dic.value(forKey: "description1") as? String
        cell.tag = indexPath.row
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let detailVC = storyboard.instantiateViewController(withIdentifier: "myDetail") as! DetailDownloadViewController
        
        let row = indexPath.row
        
        let ip = NSIndexPath(row: row, section: 0)
        let cell = downloadTableView.cellForRow(at: ip as IndexPath) as? DownloadTableViewCell
        
        detailVC.downloadNewsImage = cell?.downloadNewsImage.image
        detailVC.downloadTitle = cell?.downloadTitle.text
        detailVC.downloadDescription = cell?.dowloadDescrption.text
        
        self.navigationController?.show(detailVC, sender: self)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}
