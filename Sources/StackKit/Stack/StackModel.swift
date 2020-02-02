//  Created by Oscar Alvarez Hidalgo on 8/12/19.

import SwiftUI
import Combine

public class StackModel<CardPresentable: Identifiable>: ObservableObject {
  
  @Published var elements: [CardPresentable]
  @Published var status: StackStatus = .unselected
  @Published var positions: [CardPresentable.ID: CGSize]
  
  var configuration: StackConfiguration
  
  public init(with elements: [CardPresentable], and configuration: StackConfiguration) {
    self.configuration = configuration
    self.elements = elements
    positions = Dictionary(grouping: elements, by: { $0.id })
      .mapValues { _ in .zero }
  }
  
  func scaleEffect(from element: CardPresentable) -> CGFloat {
    isOnTop(element)    ? 1 :
    isNext(element)     ? nextCardScale() :
    isCentered(element) ? configuration.secondScale : 1
  }
  
  func isOnTop(_ element: CardPresentable) -> Bool {
    element.id == elements.last?.id
  }
  
  func isNext(_ element: CardPresentable) -> Bool {
    element.id == elements.last(where: { position(for: $0) == .zero })?.id
  }
  
  func isCentered(_ element: CardPresentable) -> Bool {
    position(for: element) == .zero
  }
  
  func nextCardScale() -> CGFloat {
    max(configuration.firstScale,
        min(1, lastPickedCardPosition.linear/(configuration.dragOffset * 10) + configuration.firstScale))
  }
  
  var lastPickedCardPosition: CGSize {
    let lastPicked = elements.first(where: { position(for: $0) != .zero})
    guard let id = lastPicked?.id else { return .zero }
    return positions[id] ?? .zero
  }
  
  func position(for element: CardPresentable) -> CGSize {
    return positions[element.id] ?? .zero
  }
  
  //MARK: - User Interaction
  
  func updatePosition(of element: CardPresentable, to position: CGSize) {
    positions[element.id] =
      configuration.movementType.finalPosition(with: position)
  }
  
  func release(_ element: CardPresentable, at position: CGSize) {
    if position.linear > configuration.minimumVelocity {
      updatePosition(of: element, to: position.normalized(to: configuration.maximumDistance))
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
        self.moveToBack(element)
        self.updatePosition(of: element, to: .zero)
      }
    } else {
      self.updatePosition(of: element, to: .zero)
    }
  }
  
  func moveToBack(_ element: CardPresentable) {
    elements.removeAll(where: { $0.id == element.id })
    elements.insert(element, at: 0)
  }
  
  var dragIsDisabled: Bool {
    configuration.disabled
  }
  
  func dragGesture(for element: CardPresentable) -> some Gesture {
    if configuration.interaction == .tap {
      return
        DragGesture().onChanged({ _ in })
        .onEnded { _ in }
    }
    return
      DragGesture()
        .onChanged { value in
          self.updatePosition(of: element,
                            to: value.translation)
      }
        .onEnded { value in
          self.release(element,
                   at: value.predictedEndTranslation)
      }
  }
  
  func tapAction(_ element: CardPresentable) {
    if configuration.interaction != .drag {
      moveToBack(element)
    }
  }
}

extension StackModel: Selectable { }
