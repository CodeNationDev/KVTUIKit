//
import Foundation
import UIKit
import SwiftMagicHelpers



public struct Theme: Codable {
    public var primaryColor: String? = nil
    public var secondaryColor: String? = nil
    public var inputBackgroundcolor: String? = nil
    public var gradientStartColor: String? = nil
    public var gradientEndColor: String? = nil
    
    
    public enum defaultThemes  {
        case lime, punch, corn, loch, grapes, magenta
        
        public var theme: Theme {
            switch self {
            
            case .loch: return Theme(primaryColor: UIColor.LochTheme.primaryColor,
                                     secondaryColor: UIColor.LochTheme.secondaryColor, inputBackgroundcolor: UIColor.LochTheme.inputBackgroundColor)
                
            case .corn: return Theme(primaryColor: UIColor.CornTheme.primaryColor, secondaryColor: UIColor.CornTheme.secondaryColor, inputBackgroundcolor: UIColor.CornTheme.inputBackgroundColor)
            case .grapes: return Theme(primaryColor: UIColor.GrapesTheme.primaryColor, secondaryColor: UIColor.GrapesTheme.secondaryColor, inputBackgroundcolor: UIColor.GrapesTheme.inputBackgroundColor)
            case .lime: return Theme(primaryColor: UIColor.LimeTheme.primaryColor,secondaryColor: UIColor.LimeTheme.secondaryColor, inputBackgroundcolor: UIColor.LimeTheme.inputBackgroundColor)
            case .punch: return Theme(primaryColor: UIColor.PunchTheme.primaryColor,secondaryColor: UIColor.PunchTheme.secondaryColor, inputBackgroundcolor: UIColor.PunchTheme.inputBackgroundColor)
            case .magenta: return Theme(primaryColor: UIColor.MagentaTheme.primaryColor,secondaryColor: UIColor.MagentaTheme.secondaryColor, inputBackgroundcolor: UIColor.MagentaTheme.inputBackgroundColor)
            }
        }
    }
    
    public init(primaryColor: String?,
                secondaryColor: String?, inputBackgroundcolor: String?) {
        
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.inputBackgroundcolor = inputBackgroundcolor
    }
}

public var theme:Theme {
    get {
        let encoded = UserDefaults.standard.object(forKey: "theme") as! String
        do {
           let storedTheme = try HelperManager.JSON.jsonDecode(encoded, type: Theme.self)
            return storedTheme
        } catch {
            return Theme.defaultThemes.punch.theme
        }
    }
    set {
        let userdefaults = UserDefaults.standard
        let encoded = try? HelperManager.JSON.jsonEncode(newValue)
        userdefaults.set(encoded, forKey: "theme")
    }
}


