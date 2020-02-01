//  Created by Oscar Alvarez Hidalgo on 8/12/19.

import CoreGraphics

public extension CGSize {
  var linear: CGFloat {
    sqrt(height * height + width * width)
  }
  
  func normalized(to length: CGFloat) -> CGSize {
    var normalized = self
    if linear > length {
      let ratio = length/linear
      normalized.height = height * ratio
      normalized.width = width * ratio
    }
    return normalized
  }
  
  var horizontal: CGSize {
    var horizontal = self
    horizontal.height = 0
    return horizontal
  }
  
  var vertical: CGSize {
    var vertical = self
    vertical.width = 0
    return vertical
  }
}
