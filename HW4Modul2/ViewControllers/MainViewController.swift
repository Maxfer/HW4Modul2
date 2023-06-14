//
//  MainViewController.swift
//  HW4Modul2
//
//  Created by Максим Шкрябин on 14.06.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func setNewValue(Red redValue: CGFloat, green greenValue: CGFloat, blue blueValue: CGFloat)
}

final class MainViewController: UIViewController {
    // MARK: — IB Outlet
    // @IBOutlet var specialityLabel: UILabel!
    
    // MARK: — Public Propereties
    // let personValue = ""
    
    // MARK: — Private Propereties
    private var redColorView: CGFloat = 1
    private var greenColorView: CGFloat = 1
    private var blueColorView: CGFloat = 1
    
        
    // MARK: — Initializrs
    // init(name: String) {
    //      self.name = name
    //}
    
    // MARK: — Override Methds
        override func viewDidLoad() {
            super.viewDidLoad()
            setColorView()
        }
    //    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        super .touchesBegan(touches, with: event)
    //        view.endEditing(true)
    //    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let settingsVC = segue.destination as? SettingsViewController else { return }
            settingsVC.redColorView = redColorView
            settingsVC.greenColorView = greenColorView
            settingsVC.blueColorView = blueColorView
            settingsVC.delegate = self
        }
    
    // MARK: — IBAction
    // @IBAction func logInDidTapped() {}
    
    // MARK: — Public Methods
    // func loadName(from string: String) { }
    
    // MARK: — Private Methods
    private func setColorView() {
        view.backgroundColor = UIColor.init(
            red: CGFloat(redColorView),
            green: CGFloat(greenColorView),
            blue: CGFloat(blueColorView),
            alpha: 1
        )
    }
    
}

// MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
    func setNewValue(Red redValue: CGFloat, green greenValue: CGFloat, blue blueValue: CGFloat) {
        self.redColorView = redValue
        self.greenColorView = greenValue
        self.blueColorView = blueValue
        setColorView()
    }
}


// MARK: — showAlert
extension UIViewController {
    
    private func showAlert(withTitle title: String,
                           andMessage message: String,
                           handler: ((UIAlertAction) -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: handler)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
