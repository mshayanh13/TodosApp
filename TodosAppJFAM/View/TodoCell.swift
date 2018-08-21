//
//  TodoCell.swift
//  TodosAppJFAM
//
//  Created by Mohammad Shayan on 8/21/18.
//  Copyright © 2018 Mohammad Shayan. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var incompleteTodosLabel: UILabel!
    
    func configureCell(todos: [Todo]) {
        var incompleted = 0
        for todo in todos {
            if !todo.completed {
                incompleted += 1
            }
        }
        userIdLabel.text = "User ID: \(todos[0].userId)"
        incompleteTodosLabel.text = "Incomplete Todos: \(incompleted)"
    }

}
