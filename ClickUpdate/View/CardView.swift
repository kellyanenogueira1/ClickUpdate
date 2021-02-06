//
//  CardView.swift
//  ClickUpdate
//
//  Created by Kellyane Nogueira on 06/02/21.
//

import SwiftUI

struct CardView: View {
    
    var card: Card
    //var dismissAction: (() -> Void)
    
    @State private var phoneNumber1: String = ""
    @State private var ddd1: String = ""
    @State private var phoneNumber2: String = ""
    @State private var ddd2: String = ""

    var body: some View {
        VStack {
            Image(card.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200, alignment: .center)
            Text(card.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
            Text(card.description)
                .lineLimit(7)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding()
            if card.id == 4 {
                HStack {
                    TextField("(DDD)", text: $ddd1)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Phone number", text: $phoneNumber1)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.center)
                    //keyboardType(.decimalPad)
                }
                HStack {
                    TextField("(DDD)", text: $ddd2)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Phone number", text: $phoneNumber2)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.center)
                }
                
                VStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Salvar") //ALterar para ButtonStyle
                    })
                }.padding()
            }
                
            if card.id == 6 {
                VStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Entendi") //ALterar para ButtonStyle
                    })
                }.padding()
            }
                
        }.padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: allCards[5])
    }
}
