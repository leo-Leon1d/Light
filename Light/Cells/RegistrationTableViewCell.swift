//
//  RegistrationTableViewCell.swift
//  Light
//
//  Created by Леонид Исраелян on 31.01.2023.
//

import UIKit

class RegistrationTableViewCell: UITableViewCell {
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.backgroundColor = .white
    }
    
    static let id = "RegistrationTableViewCell"
    
    lazy private var topView: UIView = {
        let topView = UIView()
        topView.layer.cornerRadius = 12
        topView.layer.borderWidth = 1
        topView.layer.borderColor = UIColor.borderGray.cgColor
        return topView
    }()
    
    lazy private var mainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "appleLogo")
        return image
    }()
    
    lazy private var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Продолжить с Facebook"
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    lazy private var arrowImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "arrowImage")
        image.isHidden = true
        return image
    }()
    
    lazy private var invisibleView: UIView = {
        let invisView = UIView()
        invisView.backgroundColor = .white
        
        return invisView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            
        self.selectionStyle = .none
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        
        contentView.addSubview(topView)
        topView.addSubview(mainImage)
        topView.addSubview(mainLabel)
        topView.addSubview(arrowImage)
        contentView.addSubview(invisibleView)
        
        topView.snp.makeConstraints {
            $0.height.equalTo(48)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(38)
            $0.trailing.equalToSuperview().offset(-35)
            $0.height.equalTo(18)
        }
        
        mainImage.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalTo(mainLabel.snp.centerY)
            $0.height.width.equalTo(20)
        }
        
        arrowImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(20)
        }
        
        invisibleView.snp.makeConstraints {
            $0.height.equalTo(8)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.top.equalTo(topView.snp.bottom)
        }
        
    }
    
    public func setup(name: String?, imageName: String, isActiveBorder: Bool) {
        if let name = name {
            mainLabel.text = name
            mainImage.image = UIImage(named: imageName)
            arrowImage.isHidden = true
            if isActiveBorder {
                self.layer.borderColor = UIColor(named: "borderDarkGray")?.cgColor
            } else {
                self.layer.borderColor = UIColor(named: "borderLightGray")?.cgColor
            }
        } else {
            self.layer.borderColor = UIColor.clear.cgColor
            self.layer.borderWidth = 0
            mainImage.isHidden = true
            mainLabel.isHidden = true
            arrowImage.isHidden = false
        }
        
    }
    
    func buttonAction(sender:UIButton!) {
         print("Button Clicked")
      }
            
        
    
    
}
