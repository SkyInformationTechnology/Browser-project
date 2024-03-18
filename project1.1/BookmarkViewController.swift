//
//  BookmarkViewController.swift
//  project1.1
//
//  Created by Md Akash on 18/3/24.
//

import UIKit

class BookmarkViewController: UIViewController {
    var  Bookmark : [String] = []
    var  Favorites : [String] = []
    
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        
        
    }
    
    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        tableview.reloadData()
    }
    @IBAction func buttonview(_ sender: Any) {
        ShowAleart()
    }
    
    func ShowAleart(){
     
        let alertController = UIAlertController(title: "Create Folder", message: nil, preferredStyle: .alert)

        
        alertController.addTextField { textField in
            textField.placeholder = "Folder name"
        }

      
        let createAction = UIAlertAction(title: "Create", style: .default) { action in
            if let textField = alertController.textFields?.first {
                let enteredText = textField.text ?? ""
                print("Entered text: \(enteredText)")
                self.Bookmark.append(enteredText)
                self.Favorites.append(enteredText)
                
                self.tableview.reloadData()
                print(self.Bookmark)
                print(self.Favorites)
            }
        }

        alertController.addAction(createAction)

    
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)

}
    
//    //Core Data
//    func getAllItems(){
//        do {
//            models = try context.fetch(ToDoList.fetchRequest())
//            DispatchQueue.main.async {
//                self.tableview.reloadData()
//            }
//        } catch  {
//            //error
//        }
//    }
//    func createItem(name:String){
//        let newItem = ToDoList(context: context)
//        newItem.name = name
//        newItem.createdAt = Date()
//        do {
//            try context.save()
//            getAllItems()
//        } catch  {
//
//        }
//    }
//    func deleteItem(item: ToDoList){
//        context.delete(item)
//        do {
//            try context.save()
//            getAllItems()
//        } catch  {
//
//        }
//
//    }
//    func updateItem(item: ToDoList,newName: String){
//        item.name = newName
//        do {
//            try context.save()
//            getAllItems()
//        } catch  {
//
//        }
//    }



}
extension  BookmarkViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            return Bookmark.count
        case 1:
            return Favorites.count

        default:
            break
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            cell.textLabel?.text = Bookmark[indexPath.row]
       case 1:
            cell.textLabel?.text = Favorites[indexPath.row]
        default:
            break
        }
        return cell

    }
}
