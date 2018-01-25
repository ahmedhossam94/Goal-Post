//
//  ViewController.swift
//  Goal-Post
//
//  Created by ahmed on 1/25/18.
//  Copyright © 2018 ahmed. All rights reserved.
//

import UIKit
import CoreData
class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
            let goal = Goal()
       // goal.goalCompltionValue = Int32(exactly: 12.0)

    }

    

    @IBAction func addGoalBtnWasPressed(_ sender: Any) {
        print("btn is pressed")
    }
    
}

