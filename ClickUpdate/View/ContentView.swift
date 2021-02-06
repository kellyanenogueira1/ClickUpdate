//
//  ContentView.swift
//  ClickUpdate
//
//  Created by Kellyane Nogueira on 06/02/21.
//

import SwiftUI

struct ContentView: View {
    @State var selectedPage: Int = 0
    
    
    var body: some View {
        TabView(selection: $selectedPage) {
            ForEach(0..<allCards.count) { index in
                CardView(card: allCards[index]).tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
