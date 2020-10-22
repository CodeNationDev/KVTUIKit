//
import Foundation
import UIKit
import SwiftMagicHelpers

@IBDesignable public class KVTGradientView: UIView {
    @IBInspectable public var startColor: UIColor = UIColor.white {
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable public var endColor: UIColor = UIColor.white {
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable var shadowColor: UIColor = UIColor.darkGray
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable public var shadowOpacity: Float {
        get {
            layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    @IBInspectable var shadowRadius: CGFloat {
        get {
            layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    @IBInspectable var shadowOffset: CGSize {
        get {
            layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    
    
    public override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    public override func layoutSubviews() {
        (self.layer as! CAGradientLayer).colors = [self.startColor.cgColor, self.endColor.cgColor]
        (self.layer as! CAGradientLayer).startPoint = CGPoint(x: 0.0, y: 0.0)
        (self.layer as! CAGradientLayer).endPoint = CGPoint(x: 1.0, y: 1.0)
    }
}
