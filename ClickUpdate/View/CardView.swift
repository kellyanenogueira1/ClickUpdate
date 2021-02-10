//
//  CardView.swift
//  ClickUpdate
//
//  Created by Kellyane Nogueira on 06/02/21.
//

import SwiftUI

struct CardView: View {
    
    var card: Card
    @ObservedObject var viewModel = CardViewModel()

    var dismissAction: () -> Void
    var saveAction: () -> Void
    
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
                    TextField("(DDD)", text: $viewModel.ddd1)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Phone number", text: $viewModel.phoneNumber1)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.center)
                }
                HStack {
                    TextField("(DDD)", text: $viewModel.ddd2)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Phone number", text: $viewModel.phoneNumber2)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.center)
                }
                
                VStack {
                    Button(action: saveAction, label: {
                        Text("Salvar") //ALterar para ButtonStyle
                    })
                }.padding()
            }
            
            if card.id == 6 {
                VStack {
                    Button(action: dismissAction, label: {
                        Text("Entendi") //ALterar para ButtonStyle
                    })
                }.padding()
            }
                
        }
        .padding()
        .keyboardType(.phonePad)
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(card: allCards[5], viewModel: .init())
//    }
//}
