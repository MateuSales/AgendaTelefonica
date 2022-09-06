import UIKit

class CustomTextField: UITextField {
    init(placeholder: String, keyboardType: UIKeyboardType) {
        super.init(frame: .zero)
        setupTextField(placeholder: placeholder, keyboardType: keyboardType)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupTextField(placeholder: String, keyboardType: UIKeyboardType) {
        font = UIFont.systemFont(ofSize: 20, weight: .medium)
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
        textColor = .darkGray
        textAlignment = .center
        self.placeholder = placeholder
        self.keyboardType = keyboardType
    }
}
