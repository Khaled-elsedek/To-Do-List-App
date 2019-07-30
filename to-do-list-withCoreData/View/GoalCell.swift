//
//  GoalCell.swift
//  to-do-list-withCoreData
//
//  Created by Khaled on 6/26/19.
//  Copyright © 2019 Khaled. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescreptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    
    func configureCell(goal: Goal){
        self.goalDescreptionLbl.text = goal.goalDescription
        self.goalTypeLbl.text = goal.goalType
        self.goalProgressLbl.text = String(describing: goal.goalProgress)
    }
}
