//
//  ViewController.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 21.10.2023.
//

import UIKit

final class WeatherViewController: UIViewController {

    private let primaryView = CurrentWeatherView()
    private let viewModel = CurrentWeatherViewModel()
    
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.getLocation()
        viewModel.weather?.bind({ weather in
            self.createViewModels(currentWeather: weather)
        })
        
    }

    private func createViewModels(currentWeather: CurrentWeather) {
        //var list: [HourWeather] = []
        WeatherManager.shared.getCurrentWeather(completion: { [weak self] weather in
            //list = weather.hourWeather
            self?.viewModel.weather?.value = weather
        
            self?.primaryView.configure(with: self?.viewModel ?? CurrentWeatherViewModel())
       })
      //  let hourlyViewModels = list.map { HourlyWeatherViewModel(hourWeather: $0) }

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

