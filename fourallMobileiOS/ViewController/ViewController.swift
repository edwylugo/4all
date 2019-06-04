//
//  ViewController.swift
//  fourallMobileiOS
//
//  Created by Edwy Lugo on 04/06/19.
//  Copyright © 2019 Edwy Lugo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let listsOfTasksViewModel  = ListOfTasksViewModel()
    let mainIdentifier = "showMain"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        listsOfTasksViewModel.delegate = self
        listsOfTasksViewModel.requestTasks()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case mainIdentifier :
            if let destination =  segue.destination as? MainViewController {
                destination.mainViewModel = MainViewModel(taskId: sender as! String)
            }
        default : break
        }
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listsOfTasksViewModel.taskCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cel = tableView.dequeueReusableCell(withIdentifier: "basicIdentifier")
        let taskID = listsOfTasksViewModel.taskFor(id: indexPath.row)
        cel?.textLabel?.text = taskID
        return cel!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let taskID = listsOfTasksViewModel.taskFor(id: indexPath.row)
        self.performSegue(withIdentifier: mainIdentifier, sender: taskID as Any)
    }
}


extension ViewController : ListOfTasksProtocol{
    func didAddTask(task: String, index: Int) {
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
    
    
}

