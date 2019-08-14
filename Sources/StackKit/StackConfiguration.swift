//  Created by Oscar Alvarez Hidalgo on 8/12/19.

import CoreGraphics

public struct StackConfiguration {
  var firstScale:      CGFloat = 0.9
  var secondScale:     CGFloat = 0.8
  var dragOffset:      CGFloat = 45
  var minimumVelocity: CGFloat = 350
  var maximumDistance: CGFloat = 450
  var movementType:    MovementType = .free
  var disabled :         Bool = false
  
  enum MovementType {
    case horizontal
    case vertical
    case free
  }
  
  public init() { }
}
