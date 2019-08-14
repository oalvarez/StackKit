//  Created by Oscar Alvarez Hidalgo on 8/12/19.

import Foundation

public protocol CardModel {
  associatedtype Model: Identifiable
  init(with model: Model)
}
