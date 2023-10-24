//
//  DailyWeatherCollectionViewCell.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 24.10.2023.
//

import UIKit

final class DailyWeatherCollectionViewCell: UICollectionViewCell {
    static var cellIdentifier: String { "\(Self.self)" }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}


