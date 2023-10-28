//
//  HourlyWeatherCollectionViewCell.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 24.10.2023.
//

import UIKit

final class HourlyWeatherCell: UITableViewCell {
    
    static var identifier: String { "\(Self.self)" }
    
    private let minTempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.textColor = .white
        return label
        
    }()
    
    private let maxTempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.textColor = .lightGray
        return label
    }()

    
    private var timeLabel: UILabel = {
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
            timeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20)
        ])
        
//        NSLayoutConstraint.activate([
//            icon.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: 10),
//            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            icon.widthAnchor.constraint(equalToConstant: 30),
//            icon.heightAnchor.constraint(equalToConstant: 30)
//        ])
        
        NSLayoutConstraint.activate([
            minTempLabel.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor , constant: 10),
            minTempLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            maxTempLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            maxTempLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        ])
    }
    
    private func addSubviews() {
        addSubview(minTempLabel)
        addSubview(timeLabel)
        addSubview(maxTempLabel)
        //addSubview(icon)
    }
    
    func configure(with viewModel: HourlyWeatherViewModel) {
        minTempLabel.text = viewModel.minTemp
        maxTempLabel.text = viewModel.maxTemp
        timeLabel.text = viewModel.time
        icon.image = UIImage(systemName: viewModel.iconName)
    }

}


