//
//  AutoUpdatedFriendsVC.swift
//  GeekCourseApp
//
//  Created by MacMini on 04.09.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import UIKit
import CoreData

class FriendsViewController: UITableViewController {
    
    private var request: AnyObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Friends"
        getUsers()
        tableView.register(UserTableCell.self, forCellReuseIdentifier: UserTableCell.reuseIdentifier)
    }

    
    lazy var fetchedResultsController: NSFetchedResultsController<User> = {
        
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.sortDescriptors = [
        NSSortDescriptor(key: "sectionIndex", ascending: true)
        ]
        let frc = NSFetchedResultsController(fetchRequest: request,
                                             managedObjectContext: context,
                                             sectionNameKeyPath: #keyPath(User.sectionIndex),
                                             cacheName: nil)
        frc.delegate = self
        
        do {
            try frc.performFetch()
        } catch let err {
            print(err)
        }
        return frc
    }()
    
    fileprivate func getUsers() {
        let request = ApiRequest(resource: UserResource())
        self.request = request
        
        request.load { (response: UserItems?) in
            guard let users = response?.items else { return }
            self.createUsers(users)
        }
    }
    
    fileprivate func createUsers(_ users: [JsonUser]) {
        let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        privateContext.parent = CoreDataManager.shared.persistentContainer.viewContext
        privateContext.parent?.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        users.forEach { (jsonUser) in
            
            let user = User(context: privateContext)
            user.id = Int32(jsonUser.id)
            user.firstName = jsonUser.name
            user.lastName = jsonUser.lastName
            user.imageURL = jsonUser.imageURL
            user.sectionIndex = jsonUser.name.first?.uppercased()
            do {
                try privateContext.save()
                try privateContext.parent?.save()
            } catch let saveErr {
                print("Failed to save Users:", saveErr)
            }
            
        }
    }
    
    
    
}












