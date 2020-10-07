//
import Foundation
import UIKit

public enum KVTButtonStyle {
    case normal, inverted
}

public class KVTButton: UIButton {
    
    public var action: (()-> Void)?
    public var style: KVTButtonStyle = .normal
    
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupAction()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        switch style {
        case .normal: backgroundColor = theme.primaryColor?.color()
            setTitleColor(theme.secondaryColor?.color(), for: .normal)
        case .inverted: backgroundColor = theme.secondaryColor?.color()
            setTitleColor(theme.primaryColor?.color(), for: .normal)
            layer.borderWidth = 1.0
            layer.borderColor = theme.primaryColor?.color()?.cgColor
        }
    }
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: 180.0, height: 55.0)
    }
    
    
    func setupView() {
        
        titleLabel?.font = .systemFont(ofSize: 18)
        titleEdgeInsets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        layer.cornerRadius = 10.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 10.0
    }
    
    func setupAction() {
        addTarget(self, action: #selector(actionSelector), for: .touchUpInside)
    }
    
    @objc private func actionSelector() {
        UIView.animate(withDuration: 0.05,
                       animations: {
                        self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.05) {
                            self.transform = CGAffineTransform.identity
                            self.action?()
                        }
                       })
        
    }
}
