//
//  TodoDetailViewController.swift
//  TodosAppJFAM
//
//  Created by Mohammad Shayan on 8/21/18.
//  Copyright © 2018 Mohammad Shayan. All rights reserved.
//

import UIKit

class TodoDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var todosTableView: UITableView!
    @IBOutlet weak var userIdLabel: UILabel!
    
    var userId = ""
    var todos = [Todo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userIdLabel.text = userId
        
        todosTableView.dataSource = self
        todosTableView.delegate = self
        
        todosTableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let todoCell = tableView.dequeueReusableCell(withIdentifier: "todo") as? TodoCell {
            todoCell.configureCell(todo: todos[indexPath.row])
            return todoCell
        }
        return TodoCell()
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }

}
