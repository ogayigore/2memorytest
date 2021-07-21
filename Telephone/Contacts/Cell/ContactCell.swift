//
//  ContactCell.swift
//  Telephone
//
//  Created by Igor Ogai on 21.07.2021.
//

import UIKit

class ContactCell: UITableViewCell {
    
    //MARK:- Public Properties
    
    static var cell = "cell"
    
    //MARK:- Private Properties
    
    private(set) lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.borderWidth = 1
        image.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        image.layer.cornerRadius = 25
        image.layer.masksToBounds = false
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private(set) lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK:- Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: ContactCell.cell)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Public Methods
    
    func configureCell(model: Contact) {
        image.image = model.img
        nameLabel.text = model.name
        numberLabel.text = model.phoneNumber
    }
    
    //MARK:- Private Methods
    
    private func setup() {
        addSubview(image)
        addSubview(nameLabel)
        addSubview(numberLabel)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            image.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            image.heightAnchor.constraint(equalToConstant: 50),
            image.widthAnchor.constraint(equalTo: image.heightAnchor),
            nameLabel.topAnchor.constraint(equalTo: image.topAnchor),
            nameLabel.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 8),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            numberLabel.bottomAnchor.constraint(equalTo: image.bottomAnchor),
            numberLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor),
            numberLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor)
        ])
    }
    
}
