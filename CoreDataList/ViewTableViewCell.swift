//
//  ViewTableViewCell.swift
//  CoreDataList
//
//  Created by Sukumar Anup Sukumaran on 15/07/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit

class ViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
