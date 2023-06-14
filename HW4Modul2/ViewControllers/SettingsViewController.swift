//
//  ViewController.swift
//  HW4Modul2
//
//  Created by Максим Шкрябин on 06.06.2023.
//

import UIKit

final class SettingsViewController: UIViewController {

    // MARK: — IBOutlet
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var redSlider: UISlider!
    
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var greenSlider: UISlider!
    
    @IBOutlet var blueLabel: UILabel!
    @IBOutlet var blueSlider: UISlider!
    
    // MARK: — Public Propereties
    var redColorView: CGFloat!
    var greenColorView: CGFloat!
    var blueColorView: CGFloat!
    
    unowned var delegate: SettingsViewControllerDelegate!
    
    // MARK: — Override Methds
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 20
        
        setColorSliders()
        setColorView()
        setValueView()
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
    }

    // MARK: — IBAction
    @IBAction func sliderAction(_ sender: UISlider) {
        setColorView()
        switch sender {
        case redSlider:
            redLabel.text = string(from: sender)
            redColorView = CGFloat(sender.value)
        case greenSlider:
            greenLabel.text = string(from: sender)
            greenColorView = CGFloat(sender.value)
        default:
            blueLabel.text = string(from: sender)
            blueColorView = CGFloat(sender.value)
        }
    }
    
    @IBAction func doneDidTapped() {
        view.endEditing(true)
        delegate.setNewValue(Red: redColorView,
                             green: greenColorView,
                             blue: blueColorView)
        dismiss(animated: true)
    }
    
    // MARK: — Private Methods
    private func setColorView() {
        mainView.backgroundColor = UIColor.init(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    private func setColorSliders() {
        redSlider.setValue(Float(redColorView), animated: false)
        greenSlider.setValue(Float(greenColorView), animated: false)
        blueSlider.setValue(Float(blueColorView), animated: false)
    }
    
    private func setValueView() {
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
//        guard let newValue = textField.text else { return }
//        guard let numberValue = Int(newValue) else { return }
//        if textField == minimumValueTF {
//            randomNumber.minimumValue = numberValue
//        } else {
//            randomNumber.maximumValue = numberValue
//        }
    }
}
