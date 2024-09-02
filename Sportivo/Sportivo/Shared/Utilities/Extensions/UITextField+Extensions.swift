//
//  UITextField+Extensions.swift
//  Sportivo
//
//  Created by eng.omar on 02/09/2024.
//

import Foundation
import UIKit

extension UITextField {
    @IBInspectable public var isPassword: Bool {
        set{
            addPasswordIcon(padding: 16)
        }get{
            return false
        }
    }
    
    public func addPasswordIcon(padding: CGFloat) {
        let showPasswordBtn = UIButton()
        showPasswordBtn.setImage(UIImage(systemName: "eye")?.withTintColor(self.tintColor), for: .normal)
        showPasswordBtn.setImage(UIImage(systemName: "eye.slash")?.withTintColor(self.tintColor), for: .selected)
        showPasswordBtn.contentMode = .center
        showPasswordBtn.setTitle("", for: .normal)
        showPasswordBtn.setTitle("", for: .selected)
        if "app_lang" == "ar"{
            self.leftView = showPasswordBtn
            self.leftView?.frame.size = CGSize(width: showPasswordBtn.size.width + padding, height: showPasswordBtn.size.height)
            self.leftViewMode = UITextField.ViewMode.always
        }else{
            self.rightView = showPasswordBtn
            self.rightView?.frame.size = CGSize(width: showPasswordBtn.size.width + padding, height: showPasswordBtn.size.height)
            self.rightViewMode = UITextField.ViewMode.always
        }
        showPasswordBtn.addTarget(self, action: #selector(showAndHidePassword), for: .touchUpInside)
    }
    
   @objc func showAndHidePassword(_ sender : UIButton){
        self.isSecureTextEntry.toggle()
        sender.isSelected.toggle()
    }
}
extension UITextField {
    
    func validateEmpty() -> Bool {
        guard let text = self.text else {return false}
        guard text.isEmpty else {
            return true
        }
        BGAlertPresenter.displayToast(title: "Please check", message: "\(placeholder ?? "")", type: .warning)
        return false
    }
    
    func validateEmail() -> Bool {
        guard validateEmpty() else {return false}
        guard let text = self.text else {return false}
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        guard !emailTest.evaluate(with: text) else{return true}
        BGAlertPresenter.displayToast(title: "Please enter valid", message: "\(placeholder ?? "") ", type: .warning)
        return false
    }
    
    func validatePassword() -> Bool {
        guard validateEmpty() else {return false}
        guard let text = self.text else {return false}
        guard text.count < 6 else{return true}
        BGAlertPresenter.displayToast(title: "Please enter valid", message: "\(placeholder ?? "") more than 6 characters", type: .warning)
        return false
    }

}
