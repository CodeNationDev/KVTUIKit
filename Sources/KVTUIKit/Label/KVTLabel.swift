//
import Foundation
import UIKit

public class KVTLabel: UILabel {
    public var size: CGFloat {
        get {
            return font.pointSize
        }
        set {
            font = .kidSans(size: newValue)
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        textColor = theme?.primaryColor
        font = .kidSans(size: size)
    }
}
