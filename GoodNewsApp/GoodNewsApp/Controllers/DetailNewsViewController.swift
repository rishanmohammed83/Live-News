//
//  DetailNewsViewController.swift
//  GoodNewsApp
//
//  Created by Mohammed Rishan on 02/06/20.
//  Copyright © 2020 Mohammed Rishan. All rights reserved.
//

import UIKit
import CoreData

var newNews: [NSManagedObject] = []

class DetailNewsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    
    var title1: String?
    var description1: String?
    var newzImage: UIImage?
    
    let nscontext = ((UIApplication.shared.delegate) as!
        AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        titleLabel.text = title1
        detailLabel.text = description1
        DispatchQueue.main.async {
            self.newsImageView.image = self.newzImage

        }
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
        let entity = NSEntityDescription.insertNewObject(forEntityName: "News",  into: nscontext)
        
        let imgData = newsImageView.image!.jpegData(compressionQuality: 1)
        entity.setValue(imgData, forKey: "newImage")
        
//        entity.setValue(newzImage, forKey: "newImage")
        entity.setValue(titleLabel.text, forKey:"title")
        entity.setValue(detailLabel.text, forKey: "description1")
        
        do {
            try nscontext.save()
            
        } catch {
            
        }
        print("Record Inserted")
        self.navigationController?.popViewController(animated: true)
    }
}
