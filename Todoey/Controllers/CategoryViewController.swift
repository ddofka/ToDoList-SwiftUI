//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Dovydas Dorofejevas on 27/11/2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import CyaneaOctopus

class CategoryViewController: SwipeTableViewController {
    
    let realm = try! Realm()
    
    var categoryArray: Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let navBar = navigationController?.navigationBar {
            GlobalAppearance.applyNavBarAppearance(to: navBar)  // default teal
        }
    }
    
    //MARK: - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        cell.textLabel?.text = categoryArray?[indexPath.row].name ?? "No Categories Added Yet"
        
        let bgColor = UIColor(hexString: categoryArray?[indexPath.row].colorHex ?? "00000000")
        
        cell.backgroundColor = bgColor
        
        return cell
        
    }
    
    //MARK: - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray?[indexPath.row]
        }
    }
    
    //MARK: - Data Manipulation Methods
    
    func saveCategories(category: Category){
       
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
          print("Error saving category: \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadCategories() {
        categoryArray = realm.objects(Category.self)
        
        tableView.reloadData()
    }
    
    //MARK: - Delete Data From Swipe
    
    override func updateModel(at indexPath: IndexPath) {
        if let category = self.categoryArray?[indexPath.row] {
        do {
            try self.realm.write {
                self.realm.delete(category)
            }
        } catch {
            print("Error saving done status, \(error)")
        }
       }
    }
    
    //MARK: - Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { action in
            
            let newCategory = Category()
            newCategory.name = textField.text!
            newCategory.colorHex = UIColor.randomFlatColor()!.hexString
            self.saveCategories(category: newCategory)
            
        }

        alert.addAction(action)
        alert.addTextField { field in
            textField = field
            textField.placeholder = "Add a new Category"
        }
        
        present(alert, animated: true, completion: nil)
    }
    
}




