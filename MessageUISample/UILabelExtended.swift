//
// Copyright (c) 2019, mycompany All rights reserved. 
//

import UIKit

@IBDesignable
class UILabelExtended: UILabel {

  @IBInspectable var inset:CGSize = CGSize(width: 0, height: 0)

  var padding: UIEdgeInsets {
    var hasText:Bool = false
    if let t = self.text?.count, t > 0 {
      hasText = true
    }
    else if let t = attributedText?.length, t > 0 {
      hasText = true
    }

    return hasText ?
      UIEdgeInsets(top: inset.height, left: inset.width, bottom: inset.height, right: inset.width)
      : UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
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
  

  override func drawText(in rect: CGRect) {
    super.drawText(in: rect.inset(by: padding))
  }

  override var intrinsicContentSize: CGSize {
    let size = super.intrinsicContentSize
    let pad = padding
    return CGSize(width: size.width + pad.left + pad.right, height: size.height + pad.top + pad.bottom)
  }

  override func sizeThatFits(_ size: CGSize) -> CGSize {
    let size = super.sizeThatFits(size)
    let pad = padding
    return CGSize(width: size.width + pad.left + pad.right, height: size.height + pad.top + pad.bottom)
  }
}
