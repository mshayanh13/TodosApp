//
//  UserIdCell.swift
//  TodosAppJFAM
//
//  Created by Mohammad Shayan on 8/21/18.
//  Copyright © 2018 Mohammad Shayan. All rights reserved.
//

import UIKit

class UserIdCell: UITableViewCell {

    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var incompleteTodosLabel: UILabel!
    
    func configureCell(userId: Int, incompletes: Int) {
        userIdLabel.text = "User ID: \(userId)"
        incompleteTodosLabel.text = "Incomplete Todos: \(incompletes)"
    }

}
