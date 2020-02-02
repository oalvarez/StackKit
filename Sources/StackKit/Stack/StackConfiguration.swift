//  Created by Oscar Alvarez Hidalgo on 8/12/19.

import CoreGraphics

public struct StackConfiguration {
  public var firstScale:      CGFloat
  public var secondScale:     CGFloat
  public var dragOffset:      CGFloat
  public var minimumVelocity: CGFloat
  public var maximumDistance: CGFloat
  public var movementType:    MovementType
  public var disabled :       Bool
  public var interaction:     Interaction
  
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
  
  public enum Interaction {
    case tap
    case drag
    case both
  }
  
  public init(firstScale:      CGFloat = 0.9,
              secondScale:     CGFloat = 0.8,
              dragOffset:      CGFloat = 45,
              minimumVelocity: CGFloat = 350,
              maximumDistance: CGFloat = 450,
              movementType:    MovementType = .horizontal,
              disabled:        Bool = false,
              interaction:     Interaction = .both) {
    self.firstScale = firstScale
    self.secondScale = secondScale
    self.dragOffset = dragOffset
    self.minimumVelocity = minimumVelocity
    self.maximumDistance = maximumDistance
    self.movementType = movementType
    self.disabled = disabled
    self.interaction = interaction
  }
}
