//
//  ViewController.swift
//  CoreDataList
//
//  Created by Sukumar Anup Sukumaran on 15/07/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit
import SASLogixsPack
import SASCoreData


class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameTable: UITableView!
    
    var namesArr = [String]()
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTable.delegate = viewModel
        nameTable.dataSource = viewModel
        
        viewModel.person = viewModel.dataController.fetchData(entityName: Person.entityName) as? [Person]
    }

    @IBAction func addAction(_ sender: UIBarButtonItem) {
        UIAlertController().alertWithTF(title: "Alert", msg: "Add Alert", onView: self, alertStyle: .alert) { (alertTxt) in
            print("alertTxt = \(alertTxt)")
            
            let person = Person(context: self.viewModel.dataController.viewContext)
            person.name = alertTxt
            self.viewModel.person?.append(person)
            self.viewModel.dataController.saved()
            self.nameTable.reloadData()
        }
    }
  
}

extension NSObject {
    static var identifier: String {
        return String(describing: self)
    }
}
