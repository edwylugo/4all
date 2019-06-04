//
//  ListOfTasksViewModel.swift
//  fourallMobileiOS
//
//  Created by Edwy Lugo on 04/06/19.
//  Copyright © 2019 Edwy Lugo. All rights reserved.
//

import UIKit

protocol ListOfTasksProtocol: class {
    func didAddTask(task : String,index : Int)
}
class ListOfTasksViewModel {
    
    private var tasks = [String]()
    weak var delegate : ListOfTasksProtocol?
    
    func requestTasks(){
        Request.requestListOfTasks(completion: {[weak self] taskList in
            for taskID in (taskList?.idList)! {
                self?.tasks.append(taskID)
                let index = self?.tasks.firstIndex(of: taskID) ?? 0
                self?.delegate?.didAddTask(task: taskID, index: index)
            }
        })
    }
    
    func taskFor(id: Int)->String?{return tasks[id]}
    
    func taskCount()->Int{return tasks.count}
    
    
}

