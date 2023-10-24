//
//  ViewController.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 21.10.2023.
//

import UIKit

final class WeatherViewController: UIViewController {

    private let primaryView = CurrentWeatherView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getLocation()
    }

    
    private func getLocation() {
        LocationManager.shared.getCurrentLocation { location in
            print(location)
            WeatherManager.shared.getWeather(for: location) { [weak self] in
                DispatchQueue.main.async {
                    self?.primaryView.reload()
                }
                
            }
        }
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(primaryView)
        
        NSLayoutConstraint.activate([
            primaryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            primaryView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            primaryView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            primaryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

