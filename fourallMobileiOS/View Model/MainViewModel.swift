//
//  MainViewModel.swift
//  fourallMobileiOS
//
//  Created by Edwy Lugo on 04/06/19.
//  Copyright © 2019 Edwy Lugo. All rights reserved.
//

import UIKit
protocol MainViewModelProtocol : class {
    func didDownloadTask()
}

class MainViewModel {
    weak var delegate : MainViewModelProtocol?
    
    var taskId : String!
    var task : Task?
    init(taskId : String) {
        self.taskId = taskId
    }
    
    func requestTask(){
        Request.requestTask(id: taskId, completion: {[weak self] task in
            guard  task != nil else {return}
            self?.task = task
            self?.delegate?.didDownloadTask()
        })
    }
    
}

