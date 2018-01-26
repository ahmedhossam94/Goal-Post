//
//  CreateGoalVC.swift
//  Goal-Post
//
//  Created by ahmed on 1/26/18.
//  Copyright © 2018 ahmed. All rights reserved.
//

import UIKit
import CoreData

class CreateGoalVC: UIViewController , UITextViewDelegate {

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
        var goalType :GoalType = .ShortTime
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
        goalTextView.delegate = self
        // Do any additional setup after loading the view.
    }

   
   
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        if goalTextView .text != "" && goalTextView.text != "What is your Goal ?"{
            guard let finishGoalVc = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else {return}
            finishGoalVc.initData(description: goalTextView.text, type: goalType)
            presentingViewController?.presentSecondaryDetail(finishGoalVc)
            print("my is \(goalTextView.text)")
        }
    
    }
    
    @IBAction func shortTermBtnwasPressed(_ sender: Any) {
        goalType = .ShortTime
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    
    @IBAction func longTermBtnWasPressed(_ sender: Any) {
        goalType = .LongTime
        shortTermBtn.setDeselectedColor()
        longTermBtn.setSelectedColor()
    
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
            dismissDetail()
        
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
    }
    
   
    
}


