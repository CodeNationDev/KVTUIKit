//
import Foundation
import UIKit

@IBDesignable public class KVTCard: UIView {
  
    public var maskedCorners: CACornerMask?
    
    @IBInspectable public var cornerRad: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    public init(frame: CGRect, theme: Theme? = nil, maskedCorners: CACornerMask? = nil, cornerRadius: CGFloat? = nil) {
        super.init(frame: frame)
        self.maskedCorners = maskedCorners
        if let cornerRadius = cornerRadius {
            self.cornerRad = cornerRadius
        }
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        if let maskedCorners = maskedCorners {
            layer.maskedCorners = maskedCorners
        }
        layer.cornerRadius = cornerRad
    }
    
    private func setupView() {
        backgroundColor = theme.secondaryColor?.color()
        layer.shadowColor = UIColor.shadowColor.cgColor
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.6
        layer.shadowRadius = 6.0
        
    }
    
}
