//
//  CitiesViewModel.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 30.10.2023.
//

import Foundation

final class CitiesViewModel {
    
    var cities: [City] = []
    var existedCities: [City] = []
    private let storageManager = StorageManager.shared
    var isSearchCities: Bool = false
    
    
    func addCity(_ city: City) {
        WeatherManager.shared.getCurrentWeather(city.name) { [weak self] weather in
            let newCity = City(name: city.name)
            self?.existedCities.append(newCity)
            self?.storageManager.saveCities(self?.existedCities ?? [])
        }
    }
    
    func loadCities() -> [City] {
        existedCities = storageManager.loadCities() ?? []
        return existedCities
    }
    
    func loadCitiesFromJSON() {
        if let path = Bundle.main.path(forResource: "citylist", ofType: "json"),
           let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            let decoder = JSONDecoder()
            do {
                cities = try decoder.decode([City].self, from: data)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
    
    func searchCity(withName cityName: String) -> [City] {
        DispatchQueue.global().async {
            self.loadCitiesFromJSON()
        }
        return cities.filter { $0.name.lowercased().contains(cityName.lowercased()) }
    }
    
}


