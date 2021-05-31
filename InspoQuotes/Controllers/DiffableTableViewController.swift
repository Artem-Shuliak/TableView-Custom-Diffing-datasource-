//
//  DiffableTableViewController.swift
//  InspoQuotes
//
//  Created by Artem Chouliak on 4/20/21.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import UIKit

class DiffableTableViewController: UITableViewController {

    var oldData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    
    func diffRows(newData: [String]) {
        var deletedIndexPaths = [IndexPath]()
        var insertedIndexPaths = [IndexPath]()
        
        if !oldData.isEmpty {
            let newDiff = newData.difference(from: oldData)
            
            for change in newDiff {
                switch change {
                case let .remove(offset, _, _):
                    deletedIndexPaths.append(IndexPath(row: offset, section: 0))
                case let .insert(offset, _, _):
                    insertedIndexPaths.append(IndexPath(row: offset, section: 0))
                }
            }
            
            self.tableView.performBatchUpdates({
                self.tableView.deleteRows(at: deletedIndexPaths, with: .fade)
                self.tableView.insertRows(at: insertedIndexPaths, with: .fade)
            })

        } else {
            tableView.reloadData()
        }
        let indexPath = IndexPath(row: 0, section: 1)
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
        oldData = newData

    }

}
