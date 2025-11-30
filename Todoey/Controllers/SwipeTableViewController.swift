//
//  SwipeTableViewController.swift
//  Todoey
//
//  Created by Dovydas Dorofejevas on 29/11/2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import UIKit
import SwipeCellKit

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    //TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
        
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        
        let deleteAction = SwipeAction(style: .destructive, title: nil) { action, indexPath in
            
            self.updateModel(at: indexPath)
            
        }
            
        // Just an icon, no text
        let config = UIImage.SymbolConfiguration(pointSize: 18, weight: .regular)
        deleteAction.image = UIImage(systemName: "trash", withConfiguration: config)


        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView,
                   editActionsOptionsForRowAt indexPath: IndexPath,
                   for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        return options
    }
    
    func updateModel(at indexPath: IndexPath) {
        // Update data model
    }

    
}
