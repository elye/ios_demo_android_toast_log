//
//  ViewController.swift
//  ToastLog

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
    view.addGestureRecognizer(tap)
  }

  @objc private func tapped(_: UITapGestureRecognizer) {
    showToast(message: "Toast is here", seconds: 2.0)
    print("Log is here")
  }

}

extension UIViewController {
  func showToast(message: String, seconds: Double) {
    let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    alert.view.backgroundColor = UIColor.black
    alert.view.alpha = 0.6
    alert.view.layer.cornerRadius = 15

    present(alert, animated: true)

    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
      alert.dismiss(animated: true)
    }
  }
}
