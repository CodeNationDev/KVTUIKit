//
import Foundation
import UIKit

extension UIImage {
    public static var avatarPlaceholderImageBoy:UIImage {
        UIImage(named: "boy1", in: .module, compatibleWith: nil)!
    }
    public static var avatarPlaceholderImageGirl:UIImage {
        UIImage(named: "girl1", in: .module, compatibleWith: nil)!
    }
    public static var kidsHeaderImage:UIImage {
        UIImage(named: "kids", in: .module, compatibleWith: nil)!
    }
    public static var boy2:UIImage {
        UIImage(named: "boy2", in: .module, compatibleWith: nil)!
    }
    public static var balloons1:UIImage {
        UIImage(named: "balloons1", in: .module, compatibleWith: nil)!
    }
    public static var balloons2:UIImage {
        UIImage(named: "balloons2", in: .module, compatibleWith: nil)!
    }
    
    func resizeImage(targetSize: CGSize) -> UIImage {
        let size = self.size

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }

        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
}
