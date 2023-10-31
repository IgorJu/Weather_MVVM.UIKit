//
//  CityCell.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 31.10.2023.
//

import UIKit

final class CityCell: UITableViewCell {
    static var identifier: String { "\(Self.self)" }

    
    private let cityNameLabel = UILabel()
    private let addButton = UIButton()
    private var addAction: (() -> Void)?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cityNameLabel)
        
        addButton.setTitle("Добавить", for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        contentView.addSubview(addButton)
        
        
        NSLayoutConstraint.activate([
            cityNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Sizes.small),
            cityNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Sizes.small),
            cityNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Sizes.small),
            
            addButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Sizes.small)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func addButtonTapped() {
        addAction?()
    }
    
    func configure(cityName: String, completion: @escaping (String) -> Void) {
        cityNameLabel.text = cityName
        addAction = {
            completion(cityName)
        }
    }

}

