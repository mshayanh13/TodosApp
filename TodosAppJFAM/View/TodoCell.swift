//
//  TodoCell.swift
//  TodosAppJFAM
//
//  Created by Mohammad Shayan on 8/21/18.
//  Copyright © 2018 Mohammad Shayan. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var completedLabel: UILabel!
    
    func configureCell(todo: Todo) {
        idLabel.text = "ID: \(todo.id)"
        titleLabel.text = "Title: \(todo.title)"
        completedLabel.text = "Completed: \(todo.completed)"
    }

}
