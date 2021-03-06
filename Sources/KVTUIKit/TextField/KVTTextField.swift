//
import Foundation
import UIKit

public class KVTTextField: UITextField {
    
    public override init(frame: CGRect){
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
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
        return CGSize(width: 180.0, height: 55.0)
    }
    
    func setupView() {
        font = .systemFont(ofSize: 16)
        textColor = theme.primaryColor?.color()
    }
}
