//
//  RecipeHighlights.swift
//  RecipeList2
//
//  Created by Fredrik Pahlm on 2021-12-06.
//

import SwiftUI

struct RecipeHighlightsView: View {
    var allHighlights = ""
    
    init(highlights:[String]) {
        for index in 0..<highlights.count {
            if index == highlights.count-1 {
                allHighlights += highlights[index]
            } else {
                allHighlights += highlights[index] + ", "
            }
        }
    }
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlightsView(highlights: ["Marl","Gnarl"])
    }
}
