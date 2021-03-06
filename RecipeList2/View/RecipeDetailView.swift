//
//  RecipeDetailView.swift
//  RecipeList2
//
//  Created by Fredrik Pahlm on 2021-11-14.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    @State var selectedServingSize = 2
    var body: some View {
        ScrollView{
            
            VStack(alignment: .leading) {
                // MARK: Recipe image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                Text(recipe.name)
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(.largeTitle)
                
                VStack(alignment: .leading){
                    Text("Select your serving size")
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding()
                .frame(width: 160)
                VStack(alignment: .leading){
                    // MARK: Ingredients
                    Text("Ingredients").font(.headline).padding(.bottom, 5.0)
                    ForEach(recipe.ingredients) {item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + "" + item.name.lowercased()).padding(.bottom,2)
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
