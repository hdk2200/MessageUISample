//
// Copyright (c) 2019, mycompany All rights reserved.
//

import UIKit

extension UIView {
  func show(interval: TimeInterval, duration: TimeInterval, completion: ((Bool) -> Void)?) {
    isHidden = false
    alpha = 0

    UIView.animate(
      withDuration: 0.3,
      delay: 0,
      options: UIView.AnimationOptions.curveEaseIn,
      animations: {
        self.isHidden = false
        self.alpha = 1
    },
      completion: { _ in
        UIView.animate(withDuration: 0.3,
                       delay: interval,
                       options: UIView.AnimationOptions.curveEaseIn,
                       animations: {
                        self.alpha = 0
        },
                       completion: { result in
                        self.isHidden = true
                        self.alpha = 0

                        completion?(result)

        })

    })
  }
}
