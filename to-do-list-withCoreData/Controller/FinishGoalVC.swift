//
//  FinishGoalVC.swift
//  to-do-list-withCoreData
//
//  Created by Khaled on 7/26/19.
//  Copyright © 2019 Khaled. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController , UITextViewDelegate {

    @IBOutlet weak var pointsTextField: UITextField!
    
    var goalDescription: String!
    var goalType :GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointsTextField.delegate = self as? UITextFieldDelegate
    }
    func initData(description :String,type:GoalType){
        self.goalDescription = description
        self.goalType = type
    }
    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        if pointsTextField.text != ""{
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    func save(completion: (_ finished: Bool) -> ()) {
        guard let mangedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: mangedContext)
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        do {
            try mangedContext.save()
            completion(true)
        } catch {
            debugPrint("could not save :\(error.localizedDescription)")
            completion(false)
        }
    }
}
