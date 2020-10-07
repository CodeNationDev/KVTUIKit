//
import Foundation
import UIKit

public class KVTCell: UITableViewCell {
    
    var cellView: UIView?
    
    public var mainlabel: KVTLabel = {
        let label = KVTLabel()
        label.font = .kidSans(size: 17)
        label.textColor = theme.primaryColor?.color()
        label.textAlignment = .left
        return label
    }()
    
    public var sublabel: KVTLabel = {
        let label = KVTLabel()
        label.font = .kidSans(size: 14)
        label.textColor = theme.primaryColor?.color()
        label.textAlignment = .left
        return label
    }()
    
}
