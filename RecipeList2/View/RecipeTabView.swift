//
//  RecipeTabView.swift
//  RecipeList2
//
//  Created by Fredrik Pahlm on 2021-11-19.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        
        TabView {
                Text("Featured View")
                .tabItem({
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                })
                ContentView()
                .tabItem({
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                })
            
                
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
