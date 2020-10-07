//
import Foundation
import UIKit

public class KVTTableView: UITableView {
    
    override public init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
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
        backgroundColor = theme.secondaryColor?.color()
        layer.borderWidth = 1.0
        layer.borderColor = theme.primaryColor?.color()?.cgColor
        layer.cornerRadius = 12.0
        layer.shadowColor = UIColor.shadowColor.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 7.0
        separatorStyle = .none
    }
    
    
    
}
