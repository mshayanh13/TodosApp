//
//  ViewController.swift
//  TodosAppJFAM
//
//  Created by Mohammad Shayan on 8/21/18.
//  Copyright © 2018 Mohammad Shayan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var userIdsTableView: UITableView!
    
    var incompletesPerUserId = Dictionary<Int, Int>()
    var sortedUserIdsByIncompletes = [(Int, Int)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Todo.downloadTodos {
            self.processIncompletes()
        }
        
        userIdsTableView.dataSource = self
        userIdsTableView.delegate = self
    }
    
    func processIncompletes() {
        for(userId, todos) in todosByUserId {
            var incomplete = 0
            for todo in todos {
                if !todo.completed {
                    incomplete += 1
                }
            }
            incompletesPerUserId[userId] = incomplete
        }
        sortedUserIdsByIncompletes = incompletesPerUserId.sorted(by: {$0.1 > $1.1} )
        userIdsTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedUserIdsByIncompletes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let userIdCell = tableView.dequeueReusableCell(withIdentifier: "userId") as? UserIdCell {
            let userId = sortedUserIdsByIncompletes[indexPath.row].0
            if let incompletes = incompletesPerUserId[userId] {
                userIdCell.configureCell(userId: userId, incompletes: incompletes)
            }
            return userIdCell
        }
        return UserIdCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userId = sortedUserIdsByIncompletes[indexPath.row].0
        if let todos = todosByUserId[userId] {
            performSegue(withIdentifier: "TodoDetailVC", sender: (userId, todos))
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TodoDetailVC" {
            if let todoDetailVC = segue.destination as? TodoDetailViewController {
                if let data = sender as? (Int, [Todo]) {
                    todoDetailVC.userId = "User Id: \(data.0)"
                    todoDetailVC.todos = data.1
                }
            }
        }
    }

}

