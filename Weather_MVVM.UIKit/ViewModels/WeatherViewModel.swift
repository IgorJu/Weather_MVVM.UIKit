//
//  CurrentWeatherViewModel.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 25.10.2023.
//

import Foundation

enum WeatherViewModel {
    case current(viewModel: CurrentWeatherCollectionViewCellViewModel)
    case hourly(viewModels: [HourlyWeatherCollectionViewCellViewModel])
}


final class CurrentWeatherViewModel {
    
    var weather: Bindable<CurrentWeather>?
                            
     func getLocation() {
        LocationManager.shared.getCurrentLocation { location in
            print(location)
            WeatherManager.shared.getCurrentWeather(completion: { weather in
                self.weather?.value = weather
            })
        }
    }
    
}
