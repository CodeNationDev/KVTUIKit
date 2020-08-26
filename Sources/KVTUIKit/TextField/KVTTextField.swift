//
import Foundation
import UIKit

public class KVTTextField: UITextField {
    
    public override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 2, left: 6, bottom: 2, right: 4))
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 2, left: 6, bottom: 2, right: 4))
    }
    
    
    
    override public var intrinsicContentSize: CGSize {
        return CGSize(width: 120.0, height: 30.0)
    }
    
    func setupViews() {
        backgroundColor = theme?.secondaryColor
        layer.borderWidth = 1.0
        layer.borderColor = theme?.primaryColor?.cgColor
        layer.cornerRadius = 15.0
//        layer.shadowColor = UIColor.darkGray.cgColor
//        layer.shadowOpacity = 0.5
//        layer.shadowRadius = 7.0
        font = .kidSans(size: 24)
        textColor = theme?.primaryColor
        borderStyle = .none
    }
}
