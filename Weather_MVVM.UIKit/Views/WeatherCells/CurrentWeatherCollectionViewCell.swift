//
//  CurrentWeatherCollectionViewCell.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 24.10.2023.
//

import UIKit

final class CurrentWeatherCollectionViewCell: UICollectionViewCell {
    
    static var cellIdentifier: String { "\(Self.self)" }
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 42, weight: .medium)
        return label
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .regular)
        return label
    }()

    private let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
        contentView.addSubview(tempLabel)
        contentView.addSubview(icon)
        contentView.addSubview(cityLabel)
        
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with viewModel: CurrentWeatherCollectionViewCellViewModel) {
        icon.image = UIImage(systemName: viewModel.iconName)
        tempLabel.text = viewModel.temperature
        cityLabel.text = viewModel.city
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tempLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            tempLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            tempLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            icon.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            icon.topAnchor.constraint(equalTo: tempLabel.bottomAnchor),
            icon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20),
            
            cityLabel.leftAnchor.constraint(equalTo: icon.leftAnchor, constant: 10),
            cityLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor),
            cityLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            cityLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20)

            
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cityLabel.text = nil
        tempLabel.text = nil
        icon.image = nil
    }
}
