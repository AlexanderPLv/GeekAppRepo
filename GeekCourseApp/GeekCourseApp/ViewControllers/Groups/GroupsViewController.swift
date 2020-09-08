//
//  GroupsViewController.swift
//  GeekCourseApp
//
//  Created by MacMini on 06.08.2020.
//  Copyright © 2020 com.blablabla. All rights reserved.
//

import UIKit
import CoreData

class GroupsViewController: UITableViewController {
    
    private var request: AnyObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(GroupsTableCell.self, forCellReuseIdentifier: GroupsTableCell.reuseIdentifier)
        getGroups()
    }
    
    lazy var fetchedResultsController: NSFetchedResultsController<Group> = {
        
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        let request: NSFetchRequest<Group> = Group.fetchRequest()
        request.sortDescriptors = [
            NSSortDescriptor(key: "name", ascending: true)
        ]
        let frc = NSFetchedResultsController(fetchRequest: request,
                                             managedObjectContext: context,
                                             sectionNameKeyPath: nil,
                                             cacheName: nil)
        frc.delegate = self
        
        do {
            try frc.performFetch()
        } catch let err {
            print(err)
        }
        return frc
    }()
    
    fileprivate func getGroups() {
        let request = ApiRequest(resource: GroupsResource())
        self.request = request
        
        request.load { (response: GroupItems?) in
            guard let groups = response?.items else { return }
            
            let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
            privateContext.parent = CoreDataManager.shared.persistentContainer.viewContext
            privateContext.parent?.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            groups.forEach { (jsonGroup) in
                
                let group = Group(context: privateContext)
                group.id = Int32(jsonGroup.id)
                group.name = jsonGroup.name
                group.imageURL = jsonGroup.imageURL
                do {
                    try privateContext.save()
                    try privateContext.parent?.save()
                } catch let saveErr {
                    print("Failed to save Users:", saveErr)
                }
                
            }
        }
    }
    
    
    
    
}




