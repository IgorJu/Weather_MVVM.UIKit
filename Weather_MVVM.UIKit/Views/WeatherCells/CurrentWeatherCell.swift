//
//  CurrentWeatherView.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 21.10.2023.
//

import UIKit

final class CurrentWeatherCell: UITableViewCell {
    
    static var identifier: String { "\(Self.self)" }

    private let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 42, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private let feelsLikeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .thin)
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

        backgroundColor = .clear
        addSubview(tempLabel)
        addSubview(icon)
        addSubview(cityLabel)
        addSubview(feelsLikeLabel)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with viewModel: CurrentWeatherViewModel) {
        icon.image = UIImage(systemName: viewModel.iconName)
        tempLabel.text = viewModel.temperature
        cityLabel.text = viewModel.city
        feelsLikeLabel.text = viewModel.feelsLike
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            cityLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            tempLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 20),
            tempLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
            icon.leftAnchor.constraint(equalTo: tempLabel.rightAnchor, constant: 10),
            icon.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 20),
            icon.heightAnchor.constraint(equalToConstant: 30),
            icon.widthAnchor.constraint(equalToConstant: 30),
        
          feelsLikeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
          feelsLikeLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 20)
        ])
    }    
}



