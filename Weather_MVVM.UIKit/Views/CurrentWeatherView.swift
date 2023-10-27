//
//  CurrentWeatherView.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 21.10.2023.
//

import UIKit

final class CurrentWeatherView: UIView {
    
    private weak var viewModel: CurrentWeatherViewModel?
    
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
        backgroundColor = .red
        addSubview(tempLabel)
        addSubview(icon)
        addSubview(cityLabel)
        
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with viewModel: CurrentWeatherViewModel) {
        icon.image = UIImage(systemName: viewModel.iconName)
        tempLabel.text = viewModel.temperature
        cityLabel.text = viewModel.city
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tempLabel.topAnchor.constraint(equalTo: topAnchor),
            tempLabel.leftAnchor.constraint(equalTo: leftAnchor),
            tempLabel.rightAnchor.constraint(equalTo: rightAnchor),
            
            icon.leftAnchor.constraint(equalTo: leftAnchor),
            icon.topAnchor.constraint(equalTo: tempLabel.bottomAnchor),
            icon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20),
            
            cityLabel.leftAnchor.constraint(equalTo: icon.leftAnchor, constant: 10),
            cityLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor),
            cityLabel.rightAnchor.constraint(equalTo: rightAnchor),
            cityLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20)

            
        ])
    }    
}



