//
//  Recipe.swift
//  Recipe List
//
//  Created by Fredrik Pahlm on 2021-11-12.
//

import Foundation
import SwiftUI

class Recipe: Identifiable, Decodable{
    
    var id:UUID?
    var name: String
    var featured: Bool
    var image: String
    var description: String
    var prepTime: String
    var cookTime: String
    var totalTime: String
    var servings: Int
    var highlights: [String]
    var ingredients: [Ingredient]
    var directions: [String]
}

class Ingredient: Identifiable, Decodable{
    var id:UUID?
    var name:String
    var num:Int?
    var denominator:Int?
    var unit:String?
}
