//
// Copyright (c) 2019, mycompany All rights reserved. 
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var messageView: UIView!
  @IBOutlet weak var lavel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    messageView.isHidden = true
  }

  @objc
  func injected() {
    print("I've been injected: \(self)")

    showText(text: "injected", interval: 2.0)
  }

  @IBAction func onTapShowText(_ sender: Any) {
    let fmt = DateFormatter()
    fmt.dateFormat = "HH:mm:ss.SSS"
    let dt = fmt.string(from: Date())

    showText(text: "show\n" +  dt, interval: 2.0)
  }


  func showText(text:String,interval:TimeInterval){
    lavel.text = text
    lavel.numberOfLines = 0

    self.messageView.isHidden = false
    self.messageView.alpha = 0

    UIView.animate(withDuration: 0.3,
                   delay: 0,
                   options:  UIView.AnimationOptions.curveEaseIn,
                   animations: {
                    self.messageView.isHidden = false
                    self.messageView.alpha = 1
    },
                   completion: { result in

                    UIView.animate(withDuration: 0.3,
                                   delay: interval,
                                   options:  UIView.AnimationOptions.curveEaseIn,
                                   animations: {
                                    self.messageView.alpha = 0
                    },
                                   completion: { result in
                                    self.messageView.isHidden = true
                                    self.messageView.alpha = 0

                    })

    })





  }
}

