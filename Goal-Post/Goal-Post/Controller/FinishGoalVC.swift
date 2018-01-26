//
//  FinishGoalVC.swift
//  Goal-Post
//
//  Created by ahmed on 1/26/18.
//  Copyright © 2018 ahmed. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var pointsTextField: UITextField!
    @IBOutlet weak var createGoalBtn: UIButton!
    var goalDescription: String!
    var goalType: GoalType!
   
    
    func initData(description :String , type : GoalType){
        self.goalDescription = description
        self.goalType = type
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
            createGoalBtn.bindToKeyboard()
        pointsTextField.delegate = self
        // Do any additional setup after loading the view.
   
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
        
        
    }
    
    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        if pointsTextField.text != ""{
        self.save { (compleate) in
            if compleate{
                dismiss(animated: true, completion: nil)
            }
        }
        }
    }
    func save(complition : (_ finished :Bool)->() ){
        guard let managetContext = appDelegate?.persistentContainer.viewContext else {return}
        let goal = Goal(context: managetContext)
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompltionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        do{
       try managetContext.save()
            print("successfully save")
            complition(true)
        }catch{
            debugPrint("could not save : \(error.localizedDescription)")
            complition(false)
        }
    }
    
  
    
}
