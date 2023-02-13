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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        self.selectionStyle = .none
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        
        contentView.addSubview(mainImage)
        contentView.addSubview(mainLabel)
        contentView.addSubview(arrowImage)
        
        mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.bottom.equalToSuperview().offset(-15)
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
