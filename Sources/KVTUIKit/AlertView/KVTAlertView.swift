//
import Foundation
import UIKit

public enum AlertMode {
    case oneButton, doubleButton
}

@available(iOS 13.0, *)
public class KVTAlert: UIViewController {
    
    public var actionSelector: (KVTAlertAction?,KVTAlertAction?)?
    
    let bodyView = KVTCard(frame: .zero, cornerRadius:  30)
    let headerView: UIImageView = {
        let header = UIImageView(frame: .zero)
        header.image = .balloons2
        header.contentMode = .scaleAspectFit
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    let buttonsStackview: UIStackView = {
        let sv = UIStackView(frame: .zero)
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.alignment = .center
        sv.spacing = 16.0
        return sv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20.0)
        label.textAlignment = .left
        label.textColor = theme.primaryColor?.color()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let messageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18.0)
        label.textAlignment = .justified
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .textMessageColor
        return label
    }()
    
    let dividerView: UIView =  {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1.0
        view.layer.borderColor = theme.primaryColor?.color()?.cgColor
        return view
    }()
    
    public var button1: KVTButton?
    
    public var button2: KVTButton?

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        UIView.animate(withDuration: 0.16,
            animations: {
                self.bodyView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            },
            completion: { _ in
                UIView.animate(withDuration: 0.16) {
                    self.bodyView.transform = CGAffineTransform.identity
                }
            })
    }
    
    public convenience init(title: String? = nil, message: String? = nil, actions: (KVTAlertAction? ,KVTAlertAction?)? = nil) {
        self.init()
        titleLabel.text = title
        messageLabel.text = message
        actionSelector = actions
        setupButtons()
        setupView()
    }
    
    func setupButtons() {
        if let action1 = actionSelector?.0 {
            button1 = KVTButton()
            if let button1 = button1 {
                button1.style = action1.style
                button1.setTitle(action1.title, for: .normal)
                button1.action = action1.action
                button1.translatesAutoresizingMaskIntoConstraints = false
            }
            if let button1 = button1 {
                buttonsStackview.addArrangedSubview(button1)
            }
            
        }
        if let action2 = actionSelector?.1 {
            button2 = KVTButton()
            if let button2 = button2 {
                button2.style = action2.style
                button2.setTitle(action2.title, for: .normal)
                button2.action = action2.action
                button2.translatesAutoresizingMaskIntoConstraints = false
            }
            if let button2 = button2 {
                buttonsStackview.addArrangedSubview(button2)
            }
        }
    }

    func setupView() {
//        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.layer.opacity = 0.8

        view.addSubview(blurEffectView)
        view.addSubview(bodyView)
        bodyView.addSubview(headerView)
        bodyView.addSubview(buttonsStackview)
        bodyView.addSubview(titleLabel)
        bodyView.addSubview(messageLabel)
        bodyView.addSubview(dividerView)
    
        bodyView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackview.translatesAutoresizingMaskIntoConstraints = false
        bodyView.backgroundColor = theme.secondaryColor?.color()
        
        NSLayoutConstraint.activate([
            
            bodyView.widthAnchor.constraint(equalToConstant: view.frame.width - 40),
            bodyView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bodyView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            headerView.widthAnchor.constraint(equalToConstant: view.frame.width / 3),
            headerView.heightAnchor.constraint(equalToConstant: view.frame.width / 3),
            headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerView.bottomAnchor.constraint(equalTo: bodyView.topAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: bodyView.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor, constant: -20),
            
            dividerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            dividerView.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor, constant: 20),
            dividerView.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor, constant: -20),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            
            messageLabel.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor, constant: -20),
            
            buttonsStackview.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20),
            buttonsStackview.bottomAnchor.constraint(equalTo: bodyView.bottomAnchor, constant: -20),
            buttonsStackview.centerXAnchor.constraint(equalTo: bodyView.centerXAnchor),
//            buttonsStackview.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor, constant: 20),
//            buttonsStackview.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor, constant: -20),
            
            
        ])
        
        if buttonsStackview.arrangedSubviews.count == 1 {
            NSLayoutConstraint.deactivate(buttonsStackview.constraints)
            NSLayoutConstraint.activate([
                buttonsStackview.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor, constant: (view.frame.width / 4)),
                buttonsStackview.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor, constant: (view.frame.width / 4) * -1)
            ])
        } else {
            NSLayoutConstraint.activate([
                buttonsStackview.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor, constant: 20),
                buttonsStackview.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor, constant: -20)
            ])
            
        }
        
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overCurrentContext
    }
}
