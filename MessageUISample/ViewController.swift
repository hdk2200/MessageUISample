//
// Copyright (c) 2019, mycompany All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var messageView: UIView!
  @IBOutlet weak var label: UILabelRounded!

  @IBOutlet weak var stackView: UIStackView!
  @IBOutlet weak var labelCenter: UILabelRounded!

  var labels: [UILabelRounded] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    messageView.isHidden = true
  }

  @objc
  func injected() {
    print("I've been injected: \(self)")
    showText(text: "injected", interval: 2.0)
  }

  func removeDynamicLabels() {
    labels.forEach { $0.removeFromSuperview() }
    labels.removeAll()
  }

  func createLabels(num: Int) {
    removeDynamicLabels()

    for col in 0..<3 {
      var lastY: CGFloat = 120
      for idx in 0..<num {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 * Double(idx)) {
          let frame = CGRect(x: 32 + CGFloat(col) * 120, y: lastY, width: 100, height: 16)
          let lbl = UILabelRounded(frame: frame)
          self.view.addSubview(lbl)
          self.labels.append(lbl)
          lbl.font = UIFont.systemFont(ofSize: 10)
          lbl.contentMode = .left
          lbl.text = "Label \(idx + 1)"
          lbl.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8004066781)
          lbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
          lbl.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
          lbl.layer.borderWidth = 0.5

          let padding = CGFloat(idx * 2)
          lbl.borderWidth = 1.0 * CGFloat(col)
          lbl.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
          lbl.cornerRadius = 4 * CGFloat(col)
          lbl.clipsToBounds = true
          lbl.topInset = padding
          lbl.leftInset = padding
          lbl.rightInset = padding
          lbl.bottomInset = padding
          lbl.numberOfLines = 1
          lbl.lineBreakMode = .byCharWrapping
          lbl.sizeToFit()
          let lblFrame = lbl.bounds

          lbl.show(interval: 3.0, duration: 0.3) { _ in
            print("disappeared.")
          }
          lastY += lblFrame.maxY + 4
        }
      }
    }
  }

  @IBAction func onTapShowText(_ sender: Any) {
    let fmt = DateFormatter()
    fmt.dateFormat = "HH:mm:ss.SSS"
    let dateStr = fmt.string(from: Date())

    showText(text: "show\n" + dateStr, interval: 2.0)
  }

  func showText(text: String, interval: TimeInterval) {
    showText(inCenterLabel: text, interval: interval)
    showText(inBottomLabel: text, interval: interval)
    createLabels(num: 10)
  }

  func showText(inCenterLabel text: String, interval: TimeInterval) {
    labelCenter.text = text

    labelCenter.isHidden = false
    labelCenter.alpha = 0
    labelCenter.show(interval: 3.0, duration: 0.3) { _ in
      print("disappeared.")
    }

  }

  func showText(inBottomLabel text: String, interval: TimeInterval) {
    label.text = text
    label.numberOfLines = 0

    messageView.isHidden = false
    messageView.alpha = 0
    messageView.show(interval: 3.0, duration: 0.3) { _ in
      print("disappeared.")
    }

  }
}
