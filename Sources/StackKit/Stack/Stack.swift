//  Created by Oscar Alvarez Hidalgo on 8/12/19.

import SwiftUI
import Combine

public struct Stack<CardView: Card>: View {
  @ObservedObject var viewModel: StackModel<CardView.ViewModel.Model>
  
  public var body: some View {
    ZStack {
      ForEach(viewModel.elements) { element in
        CardView(with: CardView.ViewModel(with: element))
          .scaleEffect(self.viewModel.scaleEffect(from: element))
          .offset(self.viewModel.position(for: element))
          .transition(AnyTransition.offset(x: -350, y: 0))
          //.rotationEffect(<#T##angle: Angle##Angle#>)
          .animation(.easeOut)
          .onTapGesture {
            self.viewModel.tapAction(element)
          }
          .gesture(
            self.viewModel.dragGesture(for: element)
          ).disabled(self.viewModel.dragIsDisabled)
      }
    }
  }
  
  public init(viewModel: StackModel<CardView.ViewModel.Model>) {
    self.viewModel = viewModel
  }
  
  public init(with configuration: StackConfiguration = StackConfiguration(),
              _ elements: [CardView.ViewModel.Model]) {
    self.init(viewModel: StackModel(with: elements, and: configuration))
  }
}
