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
    @IBOutlet var redTextField: UITextField!
    
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var greenTextField: UITextField!
    
    @IBOutlet var blueLabel: UILabel!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var blueTextField: UITextField!
    
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
        addDoneButtonOnNumpad(textField: redTextField)
        addDoneButtonOnNumpad(textField: greenTextField)
        addDoneButtonOnNumpad(textField: blueTextField)
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    }
    
    // MARK: — IBAction
    @IBAction func sliderAction(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redLabel.text = string(from: sender)
            redColorView = CGFloat(sender.value)
            redTextField.text = string(from: sender)
        case greenSlider:
            greenLabel.text = string(from: sender)
            greenColorView = CGFloat(sender.value)
            greenTextField.text = string(from: sender)
        default:
            blueLabel.text = string(from: sender)
            blueColorView = CGFloat(sender.value)
            blueTextField.text = string(from: sender)
        }
        setColorView()
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
        redTextField.text = string(from: redSlider)
        greenTextField.text = string(from: greenSlider)
        blueTextField.text = string(from: blueSlider)
    }
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func addDoneButtonOnNumpad(textField: UITextField) {
        
        let keypadToolbar: UIToolbar = UIToolbar()
        
        keypadToolbar.items = [
            UIBarButtonItem(
                barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
                target: self,
                action: nil
            ),
            UIBarButtonItem(
                title: "Done",
                style: UIBarButtonItem.Style.done,
                target: textField,
                action: #selector(UITextField.resignFirstResponder)
            )
        ]
        keypadToolbar.sizeToFit()
        textField.inputAccessoryView = keypadToolbar
    }
    
}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Float(newValue) else { return }
        if textField == redTextField {
            redSlider.setValue(numberValue, animated: true)
            redLabel.text = string(from: redSlider)
            redColorView = CGFloat(numberValue)
        } else if textField == greenTextField {
            greenSlider.setValue(numberValue, animated: true)
            greenLabel.text = string(from: greenSlider)
            greenColorView = CGFloat(numberValue)
        } else {
            blueSlider.setValue(numberValue, animated: true)
            blueLabel.text = string(from: blueSlider)
            blueColorView = CGFloat(numberValue)
        }
        setColorView()
    }
}
