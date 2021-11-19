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
}

// Extra
