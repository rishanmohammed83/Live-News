//
//  AppDelegate.swift
//  GoodNewsApp
//
//  Created by Mohammed Rishan on 28/04/20.
//  Copyright © 2020 Mohammed Rishan. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

   var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UINavigationBar.appearance().barTintColor = UIColor(displayP3Red: 47/255, green: 54/255, blue: 64/255, alpha: 1.0)
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        return true
    }

    // MARK: UISceneSession Lifecycle

       // add the core data persistance controller
       lazy var persistentContainer: NSPersistentContainer = {
           let container = NSPersistentContainer(name: "GoodNews")
           container.loadPersistentStores(completionHandler: { (storeDescription, error) in
               if let error = error as NSError? {
                   print("Unresolved error \(error), \(error.userInfo)")
               }
           })
           return container
       }()

       func save() {
           let context = persistentContainer.viewContext;
           if context.hasChanges {
               do {
                   try context.save()
               } catch {
                   print("Failure to save context: \(error)")
               }
           }
       }

}

