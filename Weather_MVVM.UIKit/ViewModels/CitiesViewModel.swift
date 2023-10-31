//
//  CitiesViewModel.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 30.10.2023.
//

import Foundation

final class CitiesViewModel {
    
    var cities: [CityS] = []
    
    func addCity(_ cityName: String) {
        WeatherManager.shared.getCurrentWeather(cityName) { [weak self] weather in
            let newCity = CityS(name: cityName)
            self?.cities.append(newCity)
        }
    }
    
    func loadCitiesFromJSON() {
           if let path = Bundle.main.path(forResource: "citylist", ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
               let decoder = JSONDecoder()
               do {
                   cities = try decoder.decode([CityS].self, from: data)
               } catch {
                   print("Error decoding JSON: \(error)")
               }
           }
       }
       
       func searchCity(withName cityName: String) -> [CityS] {
           return cities.filter { $0.name.lowercased().contains(cityName.lowercased()) }
       }
}


