//
import Foundation
import UIKit

extension CAGradientLayer {
    
   public func createGradientImage() -> UIImage? {
        var image: UIImage?
        UIGraphicsBeginImageContext(bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }
}

extension UIColor {
    //MARK: Gradient
    public static func gradient(firstcolor: UIColor, secondColor: UIColor) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [firstcolor, secondColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        return gradient
    }
    
    // MARK: Solid
    public static var punch = UIColor(named: "Punch", in: Bundle.module, compatibleWith: nil)!
    public static var blueWood = UIColor(named: "BlueWood", in: Bundle.module, compatibleWith: nil)!
    public static var chateau = UIColor(named: "Chateau", in: Bundle.module, compatibleWith: nil)!
    public static var corn = UIColor(named: "Corn", in: Bundle.module, compatibleWith: nil)!
    public static var greenGrass = UIColor(named: "GreenGrass", in: Bundle.module, compatibleWith: nil)!
    public static var haveLock = UIColor(named: "HaveLock", in: Bundle.module, compatibleWith: nil)!
    public static var jungle = UIColor(named: "Jungle", in: Bundle.module, compatibleWith: nil)!
    public static var lochmara = UIColor(named: "Lochmara", in: Bundle.module, compatibleWith: nil)!
    public static var nile = UIColor(named: "Nile", in: Bundle.module, compatibleWith: nil)!
    public static var observatory = UIColor(named: "Observatory", in: Bundle.module, compatibleWith: nil)!
    public static var orangeFruit = UIColor(named: "OrangeFruit", in: Bundle.module, compatibleWith: nil)!
    public static var poppy = UIColor(named: "Poppy", in: Bundle.module, compatibleWith: nil)!
    public static var seance = UIColor(named: "Seance", in: Bundle.module, compatibleWith: nil)!
    public static var studio = UIColor(named: "Studio", in: Bundle.module, compatibleWith: nil)!
    public static var tabasco = UIColor(named: "Tabasco", in: Bundle.module, compatibleWith: nil)!
    public static var taithi = UIColor(named: "Taithi", in: Bundle.module, compatibleWith: nil)!
    public static var shadowColor = UIColor(named: "ShadowColor", in: Bundle.module, compatibleWith: nil)!
    public static var textMessageColor = UIColor(named: "TextMessageColor", in: Bundle.module, compatibleWith: nil)!
    
    // MARK: Tints
    public static var punchTint05 = UIColor(named: "PunchTint05", in: Bundle.module, compatibleWith: nil)!
    public static var cornTint05 = UIColor(named: "CornTint05", in: Bundle.module, compatibleWith: nil)!
    public static var blueTint05 = UIColor(named: "BlueTint05", in: Bundle.module, compatibleWith: nil)!
    public static var purpleTint05 = UIColor(named: "PurpleTint05", in: Bundle.module, compatibleWith: nil)!
    public static var limeGreenTint05 = UIColor(named: "LimeGreenTint05", in: Bundle.module, compatibleWith: nil)!
    public static var limeGreenTint10 = UIColor(named: "LimeGreenTint10", in: Bundle.module, compatibleWith: nil)!
    
    //MARK: THEMES
    
    //MARK: Modern
    public struct ModernTheme {
        public static var primaryColor = "Lochmara"
        public static var secondaryColor = "white"
    }
    
    
    //MARK: Punch
    public static var punchPrimaryColor = UIColor(named: "punchPrimaryColor", in: Bundle.module, compatibleWith: nil)!
    public static var punchSecondaryColor = UIColor(named: "punchSecondaryColor", in: Bundle.module, compatibleWith: nil)!
    public static var punchBackgroundColor = UIColor(named: "punchBackgroundColor", in: Bundle.module, compatibleWith: nil)!
    public static var punchTextViewPlaceholder = UIColor(named: "punchTextViewPlaceholder", in: Bundle.module, compatibleWith: nil)!
    
    public struct PunchTheme {
        public static var primaryColor = "punchPrimaryColor"
        public static var secondaryColor = "punchSecondaryColor"
        public static var inputBackgroundColor = "punchInputBackgroundColor"
    }
    
    
    //MARK: Corn
    public struct CornTheme {
        public static var primaryColor = "cornPrimaryColor"
        public static var secondaryColor = "cornSecondaryColor"
        public static var inputBackgroundColor = "cornInputBackgroundColor"
        
    }
    
    //MARK: Grapes
    public struct GrapesTheme {
        public static var primaryColor = "grapesPrimaryColor"
        public static var secondaryColor = "grapesSecondaryColor"
        public static var inputBackgroundColor = "grapesInputBackgroundColor"
    }
    
    //MARK: Loch
    public struct LochTheme {
        public static var primaryColor = "lochPrimaryColor"
        public static var secondaryColor = "lochSecondaryColor"
        public static var inputBackgroundColor = "lochInputBackgroundColor"
    }
    public static var lochTextViewPlaceholder = UIColor(named: "LochTextViewPlaceholder", in: Bundle.module, compatibleWith: nil)!
    
    
    //MARK: Lime
    public static var limePrimaryColor = UIColor(named: "limePrimaryColor", in: Bundle.module, compatibleWith: nil)!
    public static var limeSecondaryColor = UIColor(named: "limeSecondaryColor", in: Bundle.module, compatibleWith: nil)!
    
    
    public struct LimeTheme {
        public static var primaryColor = "limePrimaryColor"
        public static var secondaryColor = "limeSecondaryColor"
        public static var inputBackgroundColor = "limeInputBackgroundColor"
    }
}

public extension String {
    func color() -> UIColor? {
        UIColor(named: self, in: Bundle.module, compatibleWith: nil)!
    }
}
