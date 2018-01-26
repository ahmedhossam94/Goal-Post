//
//  ViewController.swift
//  Goal-Post
//
//  Created by ahmed on 1/25/18.
//  Copyright © 2018 ahmed. All rights reserved.
//

import UIKit
import CoreData
let appDelegate = UIApplication.shared.delegate as? AppDelegate
class GoalsVC: UIViewController {
    var goals : [Goal] = []

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
         //   let goal = Goal()
       // goal.goalCompltionValue = Int32(exactly: 12.0)

    }
    
    func setProgress( atIndexPath indexPath: IndexPath){
        guard let manageContext = appDelegate?.persistentContainer.viewContext else {return}
        let chosenGoal = goals[indexPath.row]
        if chosenGoal.goalProgress < chosenGoal.goalCompltionValue{
            chosenGoal.goalProgress = chosenGoal.goalProgress + 1
        }
        else{
            return
        }
        do {
            try manageContext.save()
            print("sucess set progress")
        } catch  {
            debugPrint("could not sset progress \(error.localizedDescription)")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreDataObject()
        tableView.reloadData()
    }

    @IBAction func addGoalBtnWasPressed(_ sender: Any) {

        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreatGoalVC")else{ return }
        
        presentDetail(createGoalVC)
    }
    func fetchCoreDataObject(){
        self.fetch { (complete) in
            if complete{
                if goals.count >= 1{
                    tableView.isHidden = false
                    
                }else{
                    tableView.isHidden = true
                }
            }
        }
    }
    
}

extension GoalsVC : UITableViewDataSource ,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else {return UITableViewCell()}
        let goal = goals[indexPath.row]
        cell.configureCell(forGoal: goal)
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deledteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.removeGoal(atIndexPath: indexPath)
            self.fetchCoreDataObject()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let addAction = UITableViewRowAction(style: .normal , title: "ADD") { (rowAction, indexPath) in
            self.setProgress(atIndexPath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        deledteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        addAction.backgroundColor = #colorLiteral(red: 0.9771530032, green: 0.7062081099, blue: 0.1748393774, alpha: 1)
        return [deledteAction,addAction]
    }
    
}

extension GoalsVC{
    func removeGoal(atIndexPath indexPath: IndexPath){
        guard let manageContext = appDelegate?.persistentContainer.viewContext else {return}
        manageContext.delete(goals[indexPath.row])
        do {
            try manageContext.save()
            print("sucessfuly removed")
        } catch  {
            debugPrint("could not fetch\(error.localizedDescription)")
        }
    
    }
    
    
    
    func fetch(completion: (_ complete: Bool)->()){
        guard  let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        do{
            goals = try managedContext.fetch(fetchRequest)
            completion(true)
            
        }catch{
            debugPrint("could not fetch\(error.localizedDescription)")
            completion(false)
        }
    }
}
