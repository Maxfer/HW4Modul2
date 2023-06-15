//
//  ShowAlert.swift
//  HW4Modul2
//
//  Created by Максим Шкрябин on 15.06.2023.
//

import UIKit

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
