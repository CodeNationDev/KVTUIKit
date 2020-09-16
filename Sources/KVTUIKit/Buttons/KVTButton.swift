//
import Foundation
import UIKit


public class KVTButton: UIButton {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
    }
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: 120.0, height: 40.0)
    }
    
    func setupView() {
        backgroundColor = theme?.secondaryColor
        setTitleColor(theme?.primaryColor, for: .normal)
        titleLabel?.font = .kidSans(size: 28.0)
        titleEdgeInsets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        layer.borderWidth = 1.0
        layer.borderColor = theme?.primaryColor?.cgColor
        layer.cornerRadius = 12.0
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 7.0
    }
}
