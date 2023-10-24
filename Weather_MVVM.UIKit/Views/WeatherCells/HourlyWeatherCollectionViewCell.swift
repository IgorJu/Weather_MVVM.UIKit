//
//  HourlyWeatherCollectionViewCell.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 24.10.2023.
//

import UIKit

final class HourlyWeatherCollectionViewCell: UICollectionViewCell {
    static var cellIdentifier: String { "\(Self.self)" }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}


