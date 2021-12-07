//
//  RecipeModel.swift
//  Recipe List
//
//  Created by Fredrik Pahlm on 2021-11-12.
//

import Foundation
class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()

    init() {
        let dataService = DataService()
        self.recipes = dataService.getLocalData()
    }
    static func getPortion(ingredient: Ingredient, recipeServings: Int, targetServings: Int) -> String {
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denomenator = ingredient.denominator ?? 1
        var wholePortions = 0
        var unit = ""
        if ingredient.num != nil {
            denomenator *= recipeServings
            numerator *= targetServings
            let divisor = Rational.greatestCommonDivisor(numerator, denomenator)
            numerator /=  divisor
            denomenator /= divisor
            
            if numerator >=  denomenator {
                wholePortions = numerator/denomenator
                numerator = numerator %  denomenator
                portion += String(wholePortions)
                if numerator>0 {
                    portion += wholePortions > 0 ? " " : ""
                    portion += "\(numerator) / \(denomenator)"
                }
            }
            
                
        }
        
        if ingredient.unit != nil {
            unit = ingredient.unit!
            if wholePortions>1 {
                if unit.suffix(2) == "ch" {
                    unit += "es"
                    
                } else if unit.suffix(1) == "f" {
                    unit += "ves"
                } else {
                    unit += "s"
                }
                            
                
            }
                
            portion += ingredient.num == nil && ingredient.denominator == nil ? "" : " "
        }
        return portion + unit + " "
    }
    
}



// Extra
