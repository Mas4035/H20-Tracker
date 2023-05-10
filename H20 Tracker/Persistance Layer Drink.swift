//
//  Persistance Layer Drink.swift
//  H20 Tracker
//
//  Created by Student Guest on 5/8/23
//
//  PersistenceLayer.swift
//  Drinksual
//
//  Created by Student Guest on 4/3/23.
//

import Foundation

struct PersistenceLayer {
    // Step 1
    private(set) var Drinks: [Drink] = []
    
    // Step 2
    private static let userDefaultsDrinksKeyValue = "Drinks_ARRAY"
    
    init() {
        // Step 3
        self.loadDrinks()
    }
    // Step 7
    @discardableResult
    // Step 8
    
    
    mutating func createNewDrink(oz: Int) -> Drink {
        let newDrink = Drink(oz: oz)
        self.Drinks.insert(newDrink, at: 0) // Prepend the Drinks to the array
        self.saveDrinks()
        
        return newDrink
    }
    
    
    
    private func saveDrinks() {
        // Step 9
        guard let DrinksData = try? JSONEncoder().encode(self.Drinks) else {
            fatalError("could not encode list of Drinks")
        }
        
        // Step 10
        let userDefaults = UserDefaults.standard
        userDefaults.set(DrinksData, forKey: PersistenceLayer.userDefaultsDrinksKeyValue)
        userDefaults.synchronize()
        
    }
    // Step 11
    mutating func delete(_ DrinksIndex: Int) {
        // Remove Drinks at the given index
        self.Drinks.remove(at: DrinksIndex)
        
        // Persist on the changes we made to our Drinks array
        self.saveDrinks()
    }
    // Step 4
    private mutating func loadDrinks() {
        
        // Step 5
        let userDefaults = UserDefaults.standard
        
        // Step 6
        guard let DrinkData = userDefaults.data(forKey: PersistenceLayer.userDefaultsDrinksKeyValue),
              let Drinks = try? JSONDecoder().decode([Drink].self, from: DrinkData) else {
            return
        }
        
        self.Drinks = Drinks
    }
    
    
    mutating func markDrinksAsCompleted(_ DrinksIndex: Int) -> Drink {
        // Step 12
        var updatedDrinks = self.Drinks[DrinksIndex]
        
        // Step 13
        guard updatedDrinks.completedToday == false else { return }
        
        updatedDrinks.numberOfCompletions += 1
        
        // Step 14
        if let lastCompletionDate = updatedDrinks.lastCompletionDate, lastCompletionDate.isYesterday {
            updatedDrinks.currentStreak += 1
        } else {
            updatedDrinks.currentStreak = 1
        }
        
        // Step 15
        if updatedDrinks.currentStreak > updatedDrinks.bestStreak {
            updatedDrinks.bestStreak = updatedDrinks.currentStreak
        }
        
        // Step 16
        let now = Date()
        updatedDrinks.lastCompletionDate = now
        
        // Step 17
        self.Drinks[DrinksIndex] = updatedDrinks
        
        // Step 18
        self.saveDrinks()
        return updatedDrinks
    }
    // Step 19
    mutating func swapDrinks(DrinksIndex: Int, destinationIndex: Int) {
        let DrinksToSwap = self.Drinks[DrinksIndex]
        self.Drinks.remove(at: DrinksIndex)
        self.Drinks.insert(DrinksToSwap, at: destinationIndex)
        self.saveDrinks()
    }

    // Step 20
    mutating func setNeedsToReloadDrinks() {
        self.loadDrinks()
    }
}
