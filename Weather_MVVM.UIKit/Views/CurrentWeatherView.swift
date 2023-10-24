//
//  CurrentWeatherView.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 21.10.2023.
//

import UIKit

final class CurrentWeatherView: UIView {
    
    private var collectionView: UICollectionView?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        createCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func reload() {
        
    }
    
    private func createCollectionView() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            return self.layout(for: sectionIndex)
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self

        collectionView.register(
            CurrentWeatherCollectionViewCell.self,
            forCellWithReuseIdentifier: CurrentWeatherCollectionViewCell.cellIdentifier
        )
        collectionView.register(
            DailyWeatherCollectionViewCell.self,
            forCellWithReuseIdentifier: DailyWeatherCollectionViewCell.cellIdentifier
        )
        collectionView.register(
            HourlyWeatherCollectionViewCell.self,
            forCellWithReuseIdentifier: HourlyWeatherCollectionViewCell.cellIdentifier
        )
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        self.collectionView = collectionView
        
    }
    
    private func layout(for sectionIndex: Int) -> NSCollectionLayoutSection {
        let section = CurrentWeatherSection.allCases[sectionIndex]
        
        switch section {
        case .current:
            let item = NSCollectionLayoutItem(layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            ))
            
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(0.75)
                ),
                subitems: [item]
            )
            return NSCollectionLayoutSection(group: group)
            
        case .hourly:
            let item = NSCollectionLayoutItem(layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            ))
            
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(0.75)
                ),
                subitems: [item]
            )
            return NSCollectionLayoutSection(group: group)
            
        case .daily:
            let item = NSCollectionLayoutItem(layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            ))
            
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(0.75)
                ),
                subitems: [item]
            )
            return NSCollectionLayoutSection(group: group)
            
        }
        
    }
}

extension CurrentWeatherView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CurrentWeatherCollectionViewCell.cellIdentifier,
                for: indexPath
            ) as? CurrentWeatherCollectionViewCell else {
                fatalError()
            }
            return cell
        } else if indexPath.section == 1 {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HourlyWeatherCollectionViewCell.cellIdentifier,
                for: indexPath
            ) as? HourlyWeatherCollectionViewCell else {
                fatalError()
            }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: DailyWeatherCollectionViewCell.cellIdentifier,
                for: indexPath
            ) as? DailyWeatherCollectionViewCell else {
                fatalError()
            }
            return cell
        }
    }
    
}

