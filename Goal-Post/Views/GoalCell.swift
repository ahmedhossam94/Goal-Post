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
    
    func configureCell(description : String , type : String , goalProgressAmount : Int){
        self.goalDescriptionLbl.text = description
        self.goalTypeLbl.text = type
        self.goalProgressLbl.text = "\(goalProgressAmount)"
      //  String(describing : goalProgressAmount)
    }

}
