// $$HEADER$$

import UIKit

@IBDesignable extension UIButton {
    // swiftlint:disable valid_ibinspectable implicit_getter
    @IBInspectable public var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable public var borderColor: UIColor? {
        set {
            guard newValue != nil else { return }
            layer.borderColor = .dinnerGreen
        }
        get {
            guard layer.borderColor != nil else { return nil }
            if #available(iOS 13.0, *) {
                return .systemBackground
            } else {
                return .white
            }
        }
    }
    // swiftlint:enable valid_ibinspectable implicit_getter
    
    override public var isHighlighted: Bool {
        didSet {
            guard let currentBorderColor = borderColor else {
                return
            }
            
            let fadedColor = currentBorderColor.withAlphaComponent(0.2).cgColor
            
            if isHighlighted {
                layer.borderColor = fadedColor
            } else {
                
                self.layer.borderColor = currentBorderColor.cgColor
                
                let animation = CABasicAnimation(keyPath: "borderColor")
                animation.fromValue = fadedColor
                animation.toValue = currentBorderColor.cgColor
                animation.duration = 0.4
                self.layer.add(animation, forKey: "")
            }
        }
    }
}

//// https://stackoverflow.com/questions/28854469/change-uibutton-bordercolor-in-storyboard
