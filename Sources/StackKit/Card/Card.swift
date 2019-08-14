//  Created by Oscar Alvarez Hidalgo on 8/12/19.

import SwiftUI

public protocol Card: View {
  associatedtype ViewModel: CardModel
  var viewModel: ViewModel { get }
  init(with viewModel: ViewModel)
}
