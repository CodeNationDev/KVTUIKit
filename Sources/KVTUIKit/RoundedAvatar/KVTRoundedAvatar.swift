//
import Foundation
import UIKit

public class KVTRoundedAvatar: UIView, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
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
        imageAvatar.image = imageAvatar.image?.withRenderingMode(.alwaysTemplate)
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageAvatar.addGestureRecognizer(tapgesture)
        addSubview(imageAvatar)
        imageAvatar.isUserInteractionEnabled = true
        imageAvatar.contentMode = .scaleAspectFit
        imageAvatar.layer.cornerRadius = frame.height/2
        imageAvatar.layer.masksToBounds = true
        imageAvatar.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        backgroundColor = theme?.secondaryColor
        layer.borderWidth = 1.0
        layer.borderColor = theme?.primaryColor?.cgColor
        layer.cornerRadius = frame.height/2
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 7.0
        layoutSubviews()
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
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
