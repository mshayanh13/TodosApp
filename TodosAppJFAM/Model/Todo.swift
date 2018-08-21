//
//  Todo.swift
//  TodosAppJFAM
//
//  Created by Mohammad Shayan on 8/21/18.
//  Copyright © 2018 Mohammad Shayan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct Todo {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
    
    static func getTodosByUserId(todos: [Todo]) -> Dictionary<Int, [Todo]> {
        var todosByUserId = Dictionary<Int, [Todo]>()
        
        for todo in todos {
            var newArray = [Todo]()
            if let todoArray = todosByUserId[todo.userId] {
                newArray.append(contentsOf: todoArray)
                newArray.append(todo)
                
            } else {
                newArray.append(todo)
            }
            todosByUserId[todo.userId] = newArray
        }
        
        return todosByUserId
    }
    
    static func downloadTodos(complete: @escaping DownloadComplete) {
        
        Alamofire.request(TODOS_URL).responseJSON { (response) in
            if let todosArray = response.result.value as? [Dictionary<String, Any>] {
                for todo in todosArray {
                    let todoJSON = JSON(todo)
                    
                    if let userId = todoJSON["userId"].int {
                        if let id = todoJSON["id"].int {
                            if let title = todoJSON["title"].string {
                                if let completed = todoJSON["completed"].bool {
                                    let todo = Todo(userId: userId, id: id, title: title, completed: completed)
                                    todos.append(todo)
                                }
                            }
                        }
                    }
                }
                complete()
            }
        }
    }
}
