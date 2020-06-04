//
//  DetailDownloadViewController.swift
//  GoodNewsApp
//
//  Created by Mohammed Rishan on 03/06/20.
//  Copyright © 2020 Mohammed Rishan. All rights reserved.
//

import UIKit
import CoreData

class DetailDownloadViewController: UIViewController {

    @IBOutlet weak var detailDownloadTitleVLabel: UILabel!
    @IBOutlet weak var detailDownloadDescriptionLabel: UILabel!
    @IBOutlet weak var detailDownloadNewsImage: UIImageView!
    
    var downloadTitle: String?
    var downloadDescription: String?
    var downloadNewsImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        detailDownloadNewsImage.image = downloadNewsImage
        detailDownloadTitleVLabel.text = downloadTitle
        detailDownloadDescriptionLabel.text = downloadDescription
        
    }
    @IBAction func DeleteAction(_ sender: UIBarButtonItem) {
        
        delete()
    }
    
    func delete() {
        
        let filterTitle: String = downloadTitle!
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let requestDel = NSFetchRequest<NSFetchRequestResult>(entityName: "News")
            requestDel.returnsObjectsAsFaults = false
         // If you want to delete data on basis of some condition then you can use NSPredicate
        let predicateDel = NSPredicate(format: "title == %@", filterTitle)
          requestDel.predicate = predicateDel

            do {
                 let arrUsrObj = try context.fetch(requestDel)
                 for usrObj in arrUsrObj as! [NSManagedObject] {
                    // Fetching Object
                     context.delete(usrObj)
                    // Deleting Object
                    print("deleted : \(filterTitle)")
                }
            } catch {
                 print("Failed")
          }

           // Saving the Delete operation
            do {
                try context.save()
                
            } catch {
                print("Failed saving")
            }
        self.navigationController?.popViewController(animated: true)
    }
}
