//  Created by Oscar Alvarez Hidalgo on 8/12/19.

import SwiftUI

enum StackStatus {
  case unselected
  case selected
  
  mutating func toggle() {
    switch self {
    case .unselected: self = .selected
    case .selected:   self = .unselected
    }
  }

}

