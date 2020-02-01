//  Created by Oscar Alvarez Hidalgo on 8/12/19.

import CoreGraphics

public struct StackConfiguration {
  public var firstScale:      CGFloat = 0.9
  public var secondScale:     CGFloat = 0.8
  public var dragOffset:      CGFloat = 45
  public var minimumVelocity: CGFloat = 350
  public var maximumDistance: CGFloat = 450
  public var movementType:    MovementType = .free
  public var disabled :       Bool = false
  
  public enum MovementType {
    case horizontal
    case vertical
    case free
    
    func finalPosition(with position: CGSize) -> CGSize {
      switch self {
      case .horizontal: return position.horizontal
      case .vertical:   return position.vertical
      case .free:       return position
      }
    }
  }
  
  public init(firstScale:      CGFloat = 0.9,
              secondScale:     CGFloat = 0.8,
              dragOffset:      CGFloat = 45,
              minimumVelocity: CGFloat = 350,
              maximumDistance: CGFloat = 450,
              movementType:    MovementType = .free,
              disabled :       Bool = false) {
    self.firstScale = firstScale
    self.secondScale = secondScale
    self.dragOffset = dragOffset
    self.minimumVelocity = minimumVelocity
    self.maximumDistance = maximumDistance
    self.movementType = movementType
    self.disabled = disabled
  }
}
