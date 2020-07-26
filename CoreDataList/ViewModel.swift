//
//  ViewModel.swift
//  CoreDataList
//
//  Created by Sukumar Anup Sukumaran on 15/07/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit
import SASCoreData

class ViewModel: NSObject {
    
    var dataController: DataController!
    var dataArr = [String]()
    var person: [Person]?
    
    override init() {}
    
    init(dataController: DataController) {
     self.dataController = dataController
    }

}

extension ViewModel: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ViewTableViewCell.identifier, for: indexPath) as? ViewTableViewCell {
            //let ss = person?[indexPath.row].name
            cell.itemLabel.text = person?[indexPath.row].name
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let p = person?.remove(at: indexPath.row) {
                dataController.deletedAndSave(p)
                //dataController.saved()
            }
            
            //dataArr.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }
    
}
