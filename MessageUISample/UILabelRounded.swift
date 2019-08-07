//
// Copyright (c) 2019, mycompany All rights reserved. 
//

import Foundation
import UIKit


@IBDesignable
class UILabelRounded: UILabel {
  @IBInspectable var topInset: CGFloat = 0.0
  @IBInspectable var bottomInset: CGFloat = 0.0
  @IBInspectable var leftInset: CGFloat = 0.0
  @IBInspectable var rightInset: CGFloat = 0.0

  override func drawText(in rect: CGRect) {
//    let insets = UIEdgeInsets(top: -20, left: leftInset, bottom: bottomInset, right: rightInset)
    let insets = UIEdgeInsets(top: topInset * -1, left: leftInset, bottom: bottomInset, right: rightInset * -1)
//    let insets = UIEdgeInsets(top: 1, left: leftInset, bottom: bottomInset, right: rightInset)
    print("UILabelRounded insets: \(insets)")
    super.drawText(in: rect.inset(by: insets))
  }

  override var intrinsicContentSize: CGSize {
    let size = super.intrinsicContentSize
    return CGSize(width: size.width + leftInset + rightInset,
                  height: size.height + topInset + bottomInset)
  }

  override func sizeThatFits(_ size: CGSize) -> CGSize {
    var size = super.sizeThatFits(size)
    size.width += leftInset  + rightInset
    size.height += topInset + bottomInset
    return size
  }

  @objc
  func injected() {
    print("I've been injected: \(self)")

  }
  @IBInspectable var borderColor: UIColor = UIColor.white {
    didSet {
      layer.borderColor = borderColor.cgColor
    }
  }

  @IBInspectable var borderWidth: CGFloat = 2.0 {
    didSet {
      layer.borderWidth = borderWidth
    }
  }

  @IBInspectable var cornerRadius: CGFloat = 0.0 {
    didSet {
      layer.cornerRadius = cornerRadius
    }
  }
}
