//
import Foundation
import UIKit

public struct Theme {
   public var primaryColor: UIColor?
   public var secondaryColor: UIColor?
    
   public enum defaultThemes  {
        case punch, corn, loch, grapes, lime
        
        public var theme: Theme {
            switch self {
            case .punch: return Theme(primaryColor: .punch, secondaryColor: .punchTint05)
            case .corn: return Theme(primaryColor: .corn, secondaryColor: .cornTint05)
            case .loch: return Theme(primaryColor: .lochmara, secondaryColor: .blueTint05)
            case .grapes: return Theme(primaryColor: .studio, secondaryColor: .purpleTint05)
            case .lime: return Theme(primaryColor: .greenGrass, secondaryColor: .limeGreenTint10)
            }
        }
    }
    
    public init(primaryColor: UIColor, secondaryColor: UIColor) {
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
    }
}

public var theme:Theme? = Theme.defaultThemes.punch.theme {
    didSet {
        
    }
}


