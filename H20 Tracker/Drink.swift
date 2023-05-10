//
//  Habit.swift
//  Habitual
//
//  Created by Student Guest on 3/27/23.
//

import Foundation
import UIKit

struct Drink: Codable {
    
    var oz: Int
    var dateCreated: Date = Date()
        
        
    init(oz: Int) {
        self.oz = oz
    }
        
}


