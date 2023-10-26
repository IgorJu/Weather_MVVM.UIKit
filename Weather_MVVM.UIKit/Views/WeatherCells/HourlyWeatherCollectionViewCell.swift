//
//  HourlyWeatherCollectionViewCell.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 24.10.2023.
//

import UIKit

final class HourlyWeatherCollectionViewCell: UICollectionViewCell {
    
    static var cellIdentifier: String { "\(Self.self)" }
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 42, weight: .medium)
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

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with viewModel: HourlyWeatherCollectionViewCellViewModel) {
        tempLabel.text = viewModel.temperature
        timeLabel.text = viewModel.time
        icon.image = UIImage(systemName: viewModel.iconName)
    }

}


