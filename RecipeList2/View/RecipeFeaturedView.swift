//
//  FeaturedView.swift
//  RecipeList2
//
//  Created by Fredrik Pahlm on 2021-11-25.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model: RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
        
            Text("Featured Recepies")
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
            
            GeometryReader { geo in
                TabView(selection: $tabSelectionIndex) {
                
                ForEach (0..<model.recipes.count) { index in
                    if (model.recipes[index].featured == true) {
                        
                        Button(action: {
                            self.isDetailViewShowing = true
                        }, label: {
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.white)

                                
                                VStack(spacing: 0) {
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    Text(model.recipes[index].name)
                                        .padding(5)
                                        .font(.headline)
                                }
                                .padding(.bottom)
                                
                            }
                        })
                            .tag(index)
                            .sheet(isPresented : $isDetailViewShowing ) {
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: geo.size.width-40, height: geo.size.height-100, alignment: .center)
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 10, x: -5, y: 5 )
                }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
        
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation Time")
                    .font(.headline)
                Text(model.recipes[tabSelectionIndex].prepTime)
                Text("Highlights")
                    .font(.headline)
                //RecipeHighlightsView(highlights: model.[tabSelectionIndex].highlights)
                RecipeHighlightsView(highlights: model.recipes[tabSelectionIndex].highlights)
            }
            .padding(.leading)
        }
        .onAppear(perform:
                    {setFeaturedIndex()
        })
    }
    
    func setFeaturedIndex() {
        var index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
    
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
