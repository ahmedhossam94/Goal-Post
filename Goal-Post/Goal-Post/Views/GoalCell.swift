//
//  GoalCell.swift
//  Goal-Post
//
//  Created by ahmed on 1/25/18.
//  Copyright © 2018 ahmed. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var compleationView: UIView!
    
    func configureCell(forGoal goal : Goal){
         goalDescriptionLbl.text = goal.goalDescription        
        goalTypeLbl.text = goal.goalType
        self.goalProgressLbl.text = "\(goal.goalProgress)"
      //  String(describing : goalProgressAmount)
        
        if goal.goalCompltionValue == goal.goalProgress {
            compleationView.isHidden = false
        }
        else{
            compleationView.isHidden = true
        }
    }
    
    

}
