//  Created by Oscar Alvarez Hidalgo on 8/12/19.

import SwiftUI
import Combine

public struct Stack<CardView: Card, CardModel>: View where CardView.ViewModel == CardModel {
  @ObservedObject var viewModel: StackModel<CardModel.Model>
  
  public var body: some View {
    ZStack {
      ForEach(viewModel.elements) { element in
        return CardView(with: CardModel(with: element))
          .scaleEffect(self.viewModel.scaleEffect(from: element))
          .offset(self.viewModel.position(for: element))
          //.padding(self.viewModel.padding)
          .animation(.easeOut)
          .gesture(
            DragGesture()
              .onChanged { value in
                self.viewModel
                  .updatePosition(of: element,
                                  to: value.translation)
            }
            .onEnded { value in
              self.viewModel
                .release(element,
                         at: value.predictedEndTranslation)
            }
        ).disabled(self.viewModel.dragIsDisabled)
      }
    }
  }
  
  public init(viewModel: StackModel<CardModel.Model>) {
    self.viewModel = viewModel
  }
  
  public init(_ elements: [CardModel.Model]) {
    self.init(viewModel: StackModel(with: elements))
  }


}
