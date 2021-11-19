//
//  RecipeDetailView.swift
//  RecipeList2
//
//  Created by Fredrik Pahlm on 2021-11-14.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    var body: some View {
        ScrollView{
            
            VStack(alignment: .leading) {
                // MARK: Recipe image
                Image(recipe.image).resizable().scaledToFill()
                
                VStack(alignment: .leading){
                    // MARK: Ingredients
                    Text("Ingredients").font(.headline).padding(.bottom, 5.0)
                    ForEach(recipe.ingredients,  id: \.self) {item in
                        Text("• " + item).padding(.bottom,2)
                    }
                }
                .padding(.horizontal)
                Divider()
                
                    // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions").font(.headline).padding(.vertical)
                    ForEach(0..<recipe.directions.count, id: \.self) {Index in
                        Text(String(Index+1) + ". " + recipe.directions[Index])
                            .padding(.bottom,10)
                    }
                }
                .padding(.horizontal)
            }
            
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
