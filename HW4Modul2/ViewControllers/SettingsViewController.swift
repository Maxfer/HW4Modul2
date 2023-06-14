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
    
    // MARK: — Override Methds
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 20
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        setupView()
    }

    // MARK: — IBAction
    @IBAction func sliderAction() {
        setupView()
    }
    
    // MARK: — Private Methods
    private func setupView() {
        mainView.backgroundColor = UIColor.init(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
    }
}

