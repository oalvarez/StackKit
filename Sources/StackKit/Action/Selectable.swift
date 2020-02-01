//  Created by Oscar Alvarez Hidalgo on 8/12/19.

import SwiftUI

protocol Selectable {
  var status: StackStatus  { get }
  var padding: CGFloat     { get }
  var animation: Animation { get }
}

extension Selectable {
  var padding: CGFloat {
    switch status {
    case .unselected: return 16
    case .selected: return 0
    }
  }
  
  var animation: Animation {
    switch status {
    case .unselected: return .interactiveSpring()
    case .selected:   return .easeInOut
    }
  }
}
