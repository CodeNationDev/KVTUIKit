//
import Foundation
import UIKit

public class KVTCard: UIView {
    
    public init(frame: CGRect, theme: Theme?) {
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
    
    private func setupView() {
        backgroundColor = theme?.secondaryColor
        layer.borderWidth = 1.0
        layer.borderColor = theme?.primaryColor?.cgColor
        layer.cornerRadius = 12.0
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 7.0
    }
    
}
