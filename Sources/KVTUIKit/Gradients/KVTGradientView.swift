//
import Foundation
import UIKit
import SwiftMagicHelpers

@IBDesignable public class KVTGradientView: UIView {
    @IBInspectable var startColor: UIColor = UIColor.white
    @IBInspectable var endColor: UIColor = UIColor.white
    @IBInspectable var shadowColor: UIColor = UIColor.darkGray
        @IBInspectable var cornerRadius: CGFloat {
            get {
                layer.cornerRadius
            }
            set {
                layer.cornerRadius = newValue
            }
        }
        @IBInspectable var shadowOpacity: Float {
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
        (layer as! CAGradientLayer).colors = [startColor.cgColor, endColor.cgColor]
        (layer as! CAGradientLayer).startPoint = CGPoint(x: 0.0, y: 0.0)
        (layer as! CAGradientLayer).endPoint = CGPoint(x: 1.0, y: 1.0)
    }
}
