//
//  HourlyWeatherCollectionViewCell.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 24.10.2023.
//

import UIKit

private enum FontConstants {
    static let medium = 16.0
    static let regular = 22.0
}

final class HourlyWeatherCell: UITableViewCell {
    
    static var identifier: String { "\(Self.self)" }
    
    private let visibility: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: FontConstants.medium, weight: .light)
        label.textColor = .white
        return label
        
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: FontConstants.regular, weight: .medium)
        label.textColor = .white
        return label
    }()

    
    private var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: FontConstants.medium, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private var speedWindLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: FontConstants.medium, weight: .light)
        label.textColor = .white
        return label
    }()


    private let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setConstraints()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    private func setConstraints() {
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: Sizes.regular),
            timeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant:  Sizes.regular),
        
            icon.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant:  Sizes.small),
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.widthAnchor.constraint(equalToConstant: Sizes.iconSize),
            icon.heightAnchor.constraint(equalToConstant: Sizes.iconSize),
        
            visibility.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -Sizes.small),
            visibility.topAnchor.constraint(equalTo: topAnchor, constant: Sizes.small),
            
            speedWindLabel.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -Sizes.small),
            speedWindLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Sizes.small),

        
            tempLabel.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: Sizes.medium),
            tempLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            
            
        ])
    }
    
    private func addSubviews() {
        addSubview(speedWindLabel)
        addSubview(visibility)
        addSubview(timeLabel)
        addSubview(tempLabel)
        addSubview(icon)
    }
    
    func configure(with viewModel: HourlyWeatherViewModel) {
        visibility.text = viewModel.visibility
        speedWindLabel.text = viewModel.windSpeed
        tempLabel.text = viewModel.temperature
        timeLabel.text = viewModel.time
        icon.image = UIImage(systemName: viewModel.iconName)
    }

}


