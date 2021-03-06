// $$HEADER$$

import Foundation
import UIKit

extension UITextField {
    // swiftlint:disable implicit_getter valid_ibinspectable
    @IBInspectable public var doneAccessory: Bool {
        get {
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone {
                addDoneButtonOnKeyboard()
            }
        }
    }
    // swiftlint:enable implicit_getter valid_ibinspectable
    
    public func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar().configure {
            $0.frame = CGRect.init(
                x: 0,
                y: 0,
                width: UIScreen.main.bounds.width,
                height: 50
            )
            
            $0.barStyle = .default
        }
        
        let flexSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        let done: UIBarButtonItem = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(self.doneButtonAction)
        )
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
    
    public func addShowPasswordButton(with icon: String? = "👁️") {
        let rightButton = UIButton(type: .custom)
        rightButton.setTitle(icon, for: .normal)
        
        rightButton.frame = CGRect(
            x: 0,
            y: 0,
            width: 30,
            height: 30
        )
        
        self.rightViewMode = .always
        self.rightView = rightButton
        
        rightButton.addTarget(
            self,
            action: #selector(self.showPasswordView),
            for: .touchDown
        )
        
        rightButton.addTarget(
            self,
            action: #selector(self.hidePasswordView),
            for: .touchUpInside
        )
        
        rightButton.addTarget(
            self,
            action: #selector(self.hidePasswordView),
            for: .touchDragExit
        )
    }
    
    @objc func showPasswordView() {
        isSecureTextEntry = false
        isUserInteractionEnabled = false
    }
    
    @objc func hidePasswordView() {
        isSecureTextEntry = true
        isUserInteractionEnabled = true
    }
}
