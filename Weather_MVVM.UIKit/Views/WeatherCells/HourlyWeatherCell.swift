//
//  HourlyWeatherCollectionViewCell.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 24.10.2023.
//

import UIKit

final class HourlyWeatherCell: UITableViewCell {
    
    static var identifier: String { "\(Self.self)" }
    
    private let visibility: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = .white
        return label
        
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textColor = .white
        return label
    }()

    
    private var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private var speedWindLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .light)
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
            timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            timeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
        
            icon.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: 10),
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.widthAnchor.constraint(equalToConstant: 30),
            icon.heightAnchor.constraint(equalToConstant: 30),
        
            visibility.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -10),
            visibility.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            
            speedWindLabel.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -10),
            speedWindLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),

        
            tempLabel.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 15),
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


