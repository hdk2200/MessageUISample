//
// Copyright (c) 2019, mycompany All rights reserved. 
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var messageView: UIView!
  @IBOutlet weak var label: UILabelRounded!

  @IBOutlet weak var stackView: UIStackView!
  @IBOutlet weak var labelCenter: UILabelRounded!

  var labels:[UILabelRounded] = []
  override func viewDidLoad() {
    super.viewDidLoad()
    messageView.isHidden = true
    //    createLabels(num:20)
  }

  @objc
  func injected() {
    print("I've been injected: \(self)")
    //createLabels(num:20)
    //    labelTest.topInset = 20
    showText(text: "injected", interval: 2.0)
  }

  func createLabels(num:Int){
    labels.forEach() { $0.removeFromSuperview()}

    labels.removeAll()

    for x in 0..<3 {
      var lastY:CGFloat = 120
      for i in 0..<num {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05 * Double(i)){


          let frame = CGRect(x: 32 + CGFloat(x) *  120, y:  lastY , width: 100 , height: 16)
          let lbl = UILabelRounded(frame: frame)
          self.view.addSubview(lbl)
          self.labels.append(lbl)
          lbl.font = UIFont.systemFont(ofSize: 10)
          lbl.contentMode = .left
          lbl.text = "Label \(i+1)"
          lbl.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8004066781)
          lbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
          lbl.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
          lbl.layer.borderWidth = 0.5


          let padding = CGFloat(i * 2)
          //      let padding:CGFloat = 4.0

          lbl.borderWidth = 1.0 * CGFloat(x)
          lbl.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
          lbl.cornerRadius = 4 * CGFloat(x)
          lbl.clipsToBounds = true
          lbl.topInset = padding
          lbl.leftInset = padding
          lbl.rightInset = padding
          lbl.bottomInset = padding
          lbl.numberOfLines = 1
          lbl.lineBreakMode = .byCharWrapping
          //      stackView.addArrangedSubview(lbl)
          lbl.sizeToFit()
          let lblFrame = lbl.bounds
          let size = lbl.sizeThatFits( CGSize(width: lblFrame.width, height: lblFrame.height))

          print("\(lblFrame) \(size)")

          lastY += lblFrame.maxY  + 4


        }
      }
    }
  }

  @IBAction func onTapShowText(_ sender: Any) {
    let fmt = DateFormatter()
    fmt.dateFormat = "HH:mm:ss.SSS"
    let dt = fmt.string(from: Date())

    showText(text: "show\n" +  dt, interval: 2.0)
  }

  func showText(text:String,interval:TimeInterval){
    showText(inCenterLabel: text, interval: interval)
    showText(inBottomLabel: text, interval: interval)
    createLabels(num:10)
  }

  func showText(inCenterLabel text:String,interval:TimeInterval){
    labelCenter.text = text

    labelCenter.isHidden = false
    labelCenter.alpha = 0

    UIView.animate(withDuration: 0.3,
                   delay: 0,
                   options:  UIView.AnimationOptions.curveEaseIn,
                   animations: {
                    self.labelCenter.isHidden = false
                    self.labelCenter.alpha = 1
    },
                   completion: { result in

                    UIView.animate(withDuration: 0.3,
                                   delay: interval,
                                   options:  UIView.AnimationOptions.curveEaseIn,
                                   animations: {
                                    self.labelCenter.alpha = 0
                    },
                                   completion: { result in
                                    self.labelCenter.isHidden = true
                                    self.labelCenter.alpha = 0

                    })

    })
  }

  func showText(inBottomLabel text:String,interval:TimeInterval){
    label.text = text
    label.numberOfLines = 0

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

