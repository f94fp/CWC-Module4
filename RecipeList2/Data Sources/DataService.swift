//
//  DataService.swift
//  Recipe List
//
//  Created by Fredrik Pahlm on 2021-11-12.
//

import Foundation

class DataService {
    func getLocalData() -> [Recipe] {
        // get a URL path, create URL, create data object
        //Parse
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        guard pathString != nil else {
            return [Recipe]()
        }
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            do {
                
                let recipeData =  try  decoder.decode([Recipe].self, from: data)
                for r in recipeData {
                    r.id = UUID()
                }
                return recipeData
                                                      
                }   catch {
                    
                    print("Error parsing JSON")
                }
                                                      

        }
        catch {
            print("Could not get data")
        }
        return [Recipe]()
    }
}

