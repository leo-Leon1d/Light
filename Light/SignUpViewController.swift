//
//  SignUpViewController.swift
//  Light
//
//  Created by Леонид Исраелян on 11.01.2023.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    
    private var model: [RegistrationModel] = [
        RegistrationModel(mainImage: "profileLogo", mainText: "Ввести телефон или email", isActiveBorder: false),
        RegistrationModel(mainImage: "facebookLogo", mainText: "Продолжить с Facebook", isActiveBorder: false),
        RegistrationModel(mainImage: "googleLogo", mainText: "Продолжить с Google", isActiveBorder: false),
        RegistrationModel(mainImage: "appleLogo", mainText: "Продолжить с Apple", isActiveBorder: true),
        RegistrationModel(mainImage: "vkLogo", mainText: nil, isActiveBorder: false)
    ]
    
    lazy private var logoImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "launch-screen-logo")
        
        return view
    }()
    
    lazy private var signUpLabel: UILabel = {
        let signUp = UILabel()
        signUp.text = "Зарегистрируйтесь \n в Light"
        signUp.font = .boldSystemFont(ofSize: 24)
        signUp.numberOfLines = 2
        signUp.textAlignment = .center
        return signUp
    }()
    
    lazy private var descriptionLabel: UILabel = {
        let desc = UILabel()
        desc.text = "Смотрите развлекательные видео и фото. С \n легкостью создавайте прикольные видео и \n делитесь со всем миром."
        desc.font = .systemFont(ofSize: 14)
        desc.textColor = .mainGray
        desc.numberOfLines = 3
        desc.textAlignment = .center
        desc.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.01
        //        desc.attributedText = NSMutableAttributedString(string: "Смотрите развлекательные видео и фото. С легкостью создавайте прикольные видео и делитесь со всем миром.", attributes: [NSAttributedString.Key.kern: -0.15, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return desc
    }()
    
    
    lazy private var signInTableView: UITableView = {
        let signInTableView = UITableView()
        signInTableView.delegate = self
        signInTableView.dataSource = self
        signInTableView.register(RegistrationTableViewCell.self, forCellReuseIdentifier: RegistrationTableViewCell.id)
        signInTableView.sectionHeaderHeight = 0
        signInTableView.isScrollEnabled = false
        signInTableView.showsVerticalScrollIndicator = false
        return signInTableView
    }()
    
    lazy private var privacyPolicyLabel: UILabel = {
        let priv = UILabel()
//        priv.text = "Регистрируясь, вы принимаете условия пользовательского соглашения и положения о конфиденциальности в Kindda"
        let mutableString = NSMutableAttributedString(string: "Регистрируясь, вы принимаете условия пользовательского соглашения и положения о конфиденциальности в Kindda", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
        mutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "linkBlue") as Any, range: NSRange(location: 37, length: 28))
        mutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "linkBlue") as Any, range: NSRange(location: 67, length: 31))
        priv.attributedText = mutableString
        priv.numberOfLines = 0
        priv.textAlignment = .center
        return priv
    }()
    
    lazy private var accountHaveLabel: UILabel = {
        let haveAccount = UILabel()
        haveAccount.text = "Уже есть аккаунт?"
        haveAccount.font = .systemFont(ofSize: 15)
        return haveAccount
    }()
    
    lazy private var signInButton: UIButton = {
        let signIn = UIButton()
        signIn.setTitle("Войти", for: .normal)
        signIn.setTitleColor(UIColor(named: "link-pink"), for: .normal)
        signIn.titleLabel?.font = .boldSystemFont(ofSize: 15)
        return signIn
    }()
    
    private let bottomView: UIView = {
        let botView = UIView()
        botView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        return botView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
        self.editButtonItem.setBackButtonTitlePositionAdjustment(UIOffset(horizontal: 0, vertical: 0), for: .default)
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    @objc func buttonAction(sender: UIButton!) {
            let ButtonSenderTag: UIButton = sender
            if ButtonSenderTag.tag == 1 {

                dismiss(animated: true, completion: nil)
            }
        }
    
    private func setupView() {
        view.addSubview(logoImageView)
        view.addSubview(signUpLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(signInTableView)
        view.addSubview(bottomView)
        view.addSubview(privacyPolicyLabel)
        bottomView.addSubview(accountHaveLabel)
        bottomView.addSubview(signInButton)
        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(52)
            $0.centerX.equalTo(view.snp.centerX)
            $0.width.height.equalTo(45)
            //          $0.edges.equalTo(view) - прибить к краям
        }
        
        signUpLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(30.5)
            $0.leading.equalTo(view.snp.leading).offset(28)
            $0.trailing.equalTo(view.snp.trailing).offset(-28)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(signUpLabel.snp.bottom).offset(16)
            $0.leading.equalTo(view.snp.leading).offset(28)
            $0.trailing.equalTo(view.snp.trailing).offset(-28)
        }
        
        signInTableView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(28)
            $0.trailing.equalToSuperview().offset(-28)
            $0.height.equalTo(274)
        }
        
        bottomView.snp.makeConstraints {
            $0.bottom.equalTo(view.snp.bottom)
            $0.leading.equalTo(view.snp.leading)
            $0.trailing.equalTo(view.snp.trailing)
            $0.height.equalTo(83)
        }
        
        accountHaveLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview().offset(-25)
            $0.top.equalTo(bottomView.snp.top).offset(15)
        }
        
        signInButton.snp.makeConstraints {
            $0.leading.equalTo(accountHaveLabel.snp.trailing).offset(3)
            $0.top.equalTo(bottomView.snp.top).offset(15)
            $0.height.equalTo(18)
        }
        
        privacyPolicyLabel.snp.makeConstraints {
            $0.bottom.equalTo(bottomView.snp.top).offset(-16)
            $0.leading.equalTo(view.snp.leading).offset(28)
            $0.trailing.equalTo(view.snp.trailing).offset(-28)
        }
        
    }
    
}

extension SignUpViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: RegistrationTableViewCell.id) as? RegistrationTableViewCell {
            let item = model[indexPath.section]
            cell.setup(name: item.mainText, imageName: item.mainImage, isActiveBorder: item.isActiveBorder)
            return cell
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            let vc = NameInputViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 4 {
            if let cell = tableView.cellForRow(at: indexPath) as? RegistrationTableViewCell {
                cell.backgroundColor = .blue
                signInTableView.reloadData()
            }
        }
    }
    
    
}
