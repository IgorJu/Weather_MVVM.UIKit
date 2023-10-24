//
//  CurrentWeatherCollectionViewCell.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 24.10.2023.
//

import UIKit

final class CurrentWeatherCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "CurrentWeatherCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
