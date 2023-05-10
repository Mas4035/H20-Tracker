//
//  ViewController.swift
//  H20 Tracker
//
//  Created by Student Guest on 4/17/23.
//

import UIKit

class ViewController: UIViewController {
    
    var dailyWater: Int = 0
    var dailyGoal: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // Input Water consumption choices
    @IBAction func smallButtonA(_ sender: Any) {
        // Do stuff here to get water things in asmount place yo!!!!!
       addWater(oz: 6)
    }
    
    @IBAction func smallButtonB(_ sender: Any) {
        addWater(oz: 8)
    }
    
    @IBAction func smallButtonC(_ sender: Any) {
        addWater(oz: 12)
    }
    
    @IBAction func medButtonD(_ sender: Any) {
        addWater(oz: 32)
    }
    
    @IBAction func medButtonE(_ sender: Any) {
        addWater(oz: 40)
    }
    
    @IBAction func medButtonF(_ sender: Any) {
        addWater(oz: 50)
    }
    
    @IBAction func lrgButtonG(_ sender: Any) {
        addWater(oz: 80)
    }

    @IBAction func lrgButtonH(_ sender: Any) {
        addWater(oz: 100)
    }
    
    @IBAction func lrgButtonI(_ sender: Any) {
        addWater(oz: 128)
    }
    
    
    func addWater(oz: Int) {
        dailyWater += oz
        // dailyWaterLabel.text = "\(dailyWater)"
        displayWaterAndGoals()
    }
    
    
    //Output Data
    
    @IBOutlet weak var dailyWaterLabel: UILabel!
    
   // @IBOutlet weak var dailyGoalLabel: UILabel!
    @IBAction func dailyGoal(_ sender: Any) {
    }
    
    
    
    @IBOutlet weak var Daycomplete: UIButton!
    
    @IBAction func dayEndAction(_ sender: Any) {
        reset()
    }
    
    
    
    
    
    
    
    /// Functions
    ///
    func reset() {
        dailyWater = 0
        dailyGoal = 0
        displayWaterAndGoals()
    }
    
    func displayWaterAndGoals() {
        dailyWaterLabel.text = "(\(dailyWater)) (Oz)"
        
    }
    
    
}




//@IBOutlet weak var button: UIButton!
//
//@IBAction func buttonAction(_ sender: Any) {
//}
//
//@IBAction func pressActionButton(_ sender: Any) {
//    habit = persistence.markHabitAsCompleted(habitIndex)
//    updateUI()
//}
//// MARK: - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//// override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    // Get the new view controller using segue.destination.
//    // Pass the selected object to the new view controller.
//private func updateUI() {
//    title = habit.title
//imageView.image = habit.selectedImage.image
//    labelCurrentStreak.text = "\(habit.currentStreak) days"
//    labelTotalCompletions.text = String(habit.numberOfCompletions)
//    labelBestStreak.text = String(habit.bestStreak)
//    labelStartingDate.text = habit.dateCreated.stringValue
//
//    if habit.completedToday {
//       // buttonAction.setTitle("Completed for Today!", for: .normal)
//        button.setTitle("Completed for Today!", for: .normal)
//    } else {
//       // buttonAction.setTitle("Mark as Completed", for: .normal)
//        button.setTitle("Mark as Completed", for: .normal)
