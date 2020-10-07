//
import Foundation
import UIKit

@IBDesignable public class KVTRoundedAvatar: UIView, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBInspectable public var border:CGFloat {
        get {
            layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    
    public var imageAvatar = UIImageView()
    var newPicButton = UIButton()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    
    func setupViews() {
        if let image = imageAvatar.image?.withRenderingMode(.alwaysTemplate) {
            imageAvatar.image = image
        } else {
            imageAvatar.image = .avatarPlaceholderImageGirl
        }
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageAvatar.addGestureRecognizer(tapgesture)
        addSubview(imageAvatar)
        imageAvatar.isUserInteractionEnabled = true
        imageAvatar.contentMode = .scaleAspectFit
        imageAvatar.layer.cornerRadius = frame.height/2
        imageAvatar.layer.masksToBounds = true
        imageAvatar.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        imageAvatar.tintColor = theme.primaryColor?.color()
        
        
        backgroundColor = theme.primaryColor?.color()
        layer.borderColor = theme.primaryColor?.color()?.cgColor
        layer.cornerRadius = frame.height/2
        layoutSubviews()
    }
    
    //MARK: Camera Imagepicker
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        if let top = UIApplication.getTopViewController() {
            top.present(vc, animated: true)
        }
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        imageAvatar.image = image
    }
}
