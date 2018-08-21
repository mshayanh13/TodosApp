//
//  ViewController.swift
//  TodosAppJFAM
//
//  Created by Mohammad Shayan on 8/21/18.
//  Copyright © 2018 Mohammad Shayan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var todosTableView: UITableView!
    
    var todosByUserId = Dictionary<Int, [Todo]>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Todo.downloadTodos {
            self.todosByUserId = Todo.getTodosByUserId(todos: todos)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todosByUserId.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let todoCell = tableView.dequeueReusableCell(withIdentifier: "todo") as? TodoCell {
            
        }
    }

}

