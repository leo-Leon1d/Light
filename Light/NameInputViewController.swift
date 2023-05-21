//
//  NameInputViewController.swift
//  Light
//
//  Created by Леонид Исраелян on 08.02.2023.
//

import UIKit
import SnapKit

class NameInputViewController: UIViewController {
    
    var loginButtonBottomConstraint: Constraint?
    
    lazy private var inputNameLabel: UILabel = {
        let inputName = UILabel()
        inputName.text = "Укажите имя"
        inputName.font = .boldSystemFont(ofSize: 26)
        inputName.numberOfLines = 1
        inputName.textAlignment = .left
        inputName.textColor = .black
        return inputName
    }()
    
    lazy private var inputNameDescLabel: UILabel = {
        let inputNameDesc = UILabel()
        inputNameDesc.text = "Укажите настощее имя, чтобы подписчикам было легче найти вас"
        inputNameDesc.font = .systemFont(ofSize: 14)
        inputNameDesc.numberOfLines = 2
        inputNameDesc.textAlignment = .left
        inputNameDesc.textColor = UIColor(named: "textLightGray")
        return inputNameDesc
    }()
    
    lazy private var nameSmallLabel: UILabel = {
        let nameSmallLabel = UILabel()
        nameSmallLabel.text = "ИМЯ"
        nameSmallLabel.font = .systemFont(ofSize: 12)
        nameSmallLabel.numberOfLines = 2
        nameSmallLabel.textAlignment = .left
        nameSmallLabel.textColor = UIColor(named: "textLightGray")
        return nameSmallLabel
    }()
    
    lazy private var nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.font = .boldSystemFont(ofSize: 26)
        nameTextField.textAlignment = .left
        nameTextField.textColor = .black
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Иван Иванов", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.867, green: 0.871, blue: 0.894, alpha: 1), NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22)])
        nameTextField.delegate = self
        return nameTextField
    }()
    
    lazy private var deleteTfButton: UIButton = {
        let deleteTf = UIButton()
        deleteTf.setImage(UIImage(named: "deleteCross"), for: .normal)
        deleteTf.isHidden = true
        return deleteTf
    }()
    
    lazy private var tfBottomViewRed: UIView = {
        let tfBotView = UIView()
        tfBotView.backgroundColor = UIColor.errorRed
        tfBotView.isHidden = true
        return tfBotView
    }()
    
    lazy private var tfBottomViewGray: UIView = {
        let tfBotView = UIView()
        tfBotView.backgroundColor = UIColor.tfBottomViewColor
        return tfBotView
    }()
    
    lazy private var forbiddenNameLabel: UILabel = {
        let forbidName = UILabel()
        forbidName.text = "Недопустимое имя"
        forbidName.font = .systemFont(ofSize: 14)
        forbidName.textAlignment = .left
        forbidName.textColor = UIColor.errorRed
        forbidName.isHidden = true
        return forbidName
    }()
    
    lazy private var continueButton: UIButton = {
        let continueButton = UIButton()
        continueButton.backgroundColor = .buttonGray
        continueButton.setTitleColor(.buttonTextGray, for: .normal)
        continueButton.setTitle("Продолжить", for: .normal)
        continueButton.layer.cornerRadius = 12
        return continueButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.title = "Регистрация"
        
        setupBackButton()
        setupView()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameTextField.becomeFirstResponder()
    }
    
    private func setupBackButton() {
        let backCross = UIImage(named: "backCross")
        
        self.navigationController?.navigationBar.backIndicatorImage = backCross
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backCross
        self.navigationController?.navigationBar.backItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        
        
    }
    
    private func setupView() {
        
        view.addSubview(inputNameLabel)
        view.addSubview(inputNameDescLabel)
        view.addSubview(nameSmallLabel)
        view.addSubview(nameTextField)
        view.addSubview(deleteTfButton)
        view.addSubview(tfBottomViewRed)
        view.addSubview(forbiddenNameLabel)
        view.addSubview(continueButton)
        view.addSubview(tfBottomViewGray)
        
        inputNameLabel.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(120)
            $0.left.equalTo(view.snp.left).offset(28)
            $0.right.equalTo(view.snp.right).offset(-28)
            $0.height.equalTo(31)
        }
        
        inputNameDescLabel.snp.makeConstraints {
            $0.top.equalTo(inputNameLabel.snp.bottom).offset(16)
            $0.left.equalTo(view.snp.left).offset(28)
            $0.right.equalTo(view.snp.right).offset(-28)
            $0.height.equalTo(34)
        }
        
        nameSmallLabel.snp.makeConstraints {
            $0.top.equalTo(inputNameDescLabel.snp.bottom).offset(28)
            $0.left.equalTo(view.snp.left).offset(28)
            $0.right.equalTo(view.snp.right).offset(-20)
            $0.height.equalTo(14)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameSmallLabel.snp.bottom).offset(16)
            $0.left.equalTo(view.snp.left).offset(28)
            $0.right.equalTo(view.snp.right).offset(-20)
            $0.height.equalTo(29)
        }
        
        deleteTfButton.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.top).offset(6)
            $0.right.equalTo(nameTextField.snp.right)
            $0.height.width.equalTo(16)
        }
        
        tfBottomViewRed.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(12)
            $0.left.equalTo(view.snp.left).offset(28)
            $0.right.equalTo(view.snp.right).offset(-20)
            $0.height.equalTo(2)
        }
        
        tfBottomViewGray.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(12)
            $0.left.equalTo(view.snp.left).offset(28)
            $0.right.equalTo(view.snp.right).offset(-20)
            $0.height.equalTo(2)
        }
        
        forbiddenNameLabel.snp.makeConstraints {
            $0.top.equalTo(tfBottomViewRed.snp.bottom).offset(16)
            $0.left.equalTo(view.snp.left).offset(27)
            $0.right.equalTo(view.snp.right).offset(-29)
        }
        
        continueButton.snp.makeConstraints {
            loginButtonBottomConstraint = $0.bottom.equalToSuperview().offset(-24).constraint
            $0.left.equalTo(view.snp.left).offset(28)
            $0.right.equalTo(view.snp.right).offset(-20)
            $0.height.equalTo(48)
        }
    }

    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        
        
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        
    }
    
}

extension NameInputViewController: UITextFieldDelegate {
    
        
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
                guard let stringRange = Range(range, in: currentText) else { return false }
                let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        if updatedText.count > 0 {
            continueButton.backgroundColor = .buttonBlue
            continueButton.titleLabel?.textColor = .white
        } else {
            continueButton.backgroundColor = .buttonGray
            continueButton.titleLabel?.textColor = .buttonTextGray
        }
        
        if updatedText == "Light" {
            tfBottomViewRed.isHidden = false
            forbiddenNameLabel.isHidden = false
            continueButton.backgroundColor = .buttonGray
            continueButton.titleLabel?.textColor = .buttonTextGray
            continueButton.isUserInteractionEnabled = false
            tfBottomViewGray.isHidden = true
        } else {
            tfBottomViewRed.isHidden = true
            forbiddenNameLabel.isHidden = true
            continueButton.backgroundColor = .buttonBlue
            continueButton.titleLabel?.textColor = .white
            continueButton.isUserInteractionEnabled = true
            continueButton.isEnabled = true
            tfBottomViewGray.isHidden = false
        }
        
        if updatedText.count > 0 {
            
            if updatedText == "Light" {
                continueButton.backgroundColor = .buttonGray
                continueButton.titleLabel?.textColor = .buttonTextGray
                
                continueButton.isUserInteractionEnabled = false
                tfBottomViewRed.isHidden = false
                forbiddenNameLabel.isHidden = false
            } else {
                continueButton.backgroundColor = .buttonBlue
                continueButton.titleLabel?.textColor = .white
                
                continueButton.isUserInteractionEnabled = true
                tfBottomViewRed.isHidden = true
                forbiddenNameLabel.isHidden = true
            }
            
        } else {
            continueButton.backgroundColor = .buttonGray
            continueButton.titleLabel?.textColor = .buttonTextGray
            
            continueButton.isUserInteractionEnabled = false
            tfBottomViewRed.isHidden = true
            forbiddenNameLabel.isHidden = true
        }
        
        return true
    }
    
        
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//
//    }

}
