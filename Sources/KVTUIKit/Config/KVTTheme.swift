//
import Foundation
import UIKit

public struct Theme {
   public var primaryColor: UIColor?
   public var secondaryColor: UIColor?
    
   public enum defaultThemes  {
        case punch, corn
        
        public var theme: Theme {
            switch self {
            case .punch: return Theme(primaryColor: UIColor.punch, secondaryColor: UIColor.punchTint05)
            case .corn: return Theme(primaryColor: .corn, secondaryColor: .cornTint05)
            }
        }
    }
    
    public init(primaryColor: UIColor, secondaryColor: UIColor) {
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
    }
}

public var theme:Theme? = Theme.defaultThemes.punch.theme


