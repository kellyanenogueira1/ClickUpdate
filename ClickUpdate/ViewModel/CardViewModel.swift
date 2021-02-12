//
//  CardViewModel.swift
//  ClickUpdate
//
//  Created by Kellyane Nogueira on 09/02/21.
//

import SwiftUI

class CardViewModel: ObservableObject {
    @Published var phoneNumber1: String = ""
    @Published var ddd1: String = ""
    
    @Published var didSave = false
    @Published var alert = false
    
}

