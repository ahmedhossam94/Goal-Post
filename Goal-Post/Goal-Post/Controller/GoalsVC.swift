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
        tableView.delegate = self
        tableView.dataSource = self
         //   let goal = Goal()
       // goal.goalCompltionValue = Int32(exactly: 12.0)

    }

    

    @IBAction func addGoalBtnWasPressed(_ sender: Any) {
        print("btn is pressed")
    }
    
}

extension GoalsVC : UITableViewDataSource ,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else {return UITableViewCell()}
        cell.configureCell(description: "Eat salad for two weak and 2 months", type: .LongTime, goalProgressAmount: 2)
        return cell
    }
}

