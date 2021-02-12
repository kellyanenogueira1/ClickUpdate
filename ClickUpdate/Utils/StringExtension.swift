//
//  StringExtension.swift
//  ClickUpdate
//
//  Created by Kellyane Nogueira on 09/02/21.
//

import Foundation

extension String {
   var isNumeric: Bool {
     return !(self.isEmpty) && self.allSatisfy { $0.isNumber }
   }
}
