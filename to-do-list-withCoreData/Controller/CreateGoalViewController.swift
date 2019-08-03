//
//  CreateGoalVC.swift
//  to-do-list-withCoreData
//
//  Created by Khaled on 6/26/19.
//  Copyright © 2019 Khaled. All rights reserved.
//

import UIKit

class CreateGoalViewController: UIViewController , UITextViewDelegate {

    @IBOutlet weak var goalTxtView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType : GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
        goalTxtView.delegate = self

    }
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        if goalTxtView.text != "" && goalTxtView.text != "What is your goal" {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else {return}
            finishGoalVC.initData(description: goalTxtView.text, type: goalType)
            presentingViewController?.presentSecondaryDetail(finishGoalVC)

        }
    }
    
    @IBAction func shortTermBtnWasPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    @IBAction func longTermBtnWasPressed(_ sender: Any) {
        goalType = .longTerm
        shortTermBtn.setDeselectedColor()
        longTermBtn.setSelectedColor()
    }
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTxtView.text = ""
        goalTxtView.textColor = .black
    }
}
