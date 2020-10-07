//
import Foundation
import UIKit

public struct KVTAlertAction {
    var title: String
    var style: KVTButtonStyle
    var action: () -> Void

    public init(title: String, style: KVTButtonStyle? = .normal, action: @escaping () -> Void) {
        self.title = title
        self.style = style!
        self.action = action
    }
}
