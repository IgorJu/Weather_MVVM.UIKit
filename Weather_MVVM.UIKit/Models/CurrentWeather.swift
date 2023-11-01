//
//  CurrentWeather.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 25.10.2023.
//

import Foundation

struct CurrentWeather: Codable {
    let list: [HourWeather]
    let city: City
}

// MARK: - City
struct City: Codable {
    let name: String
}

// MARK: - List
struct HourWeather: Codable {
    let main: MainClass
    let weather: [WeatherElement]
    let wind: Wind
    let visibility: Int
    let dtTxt: String

    enum CodingKeys: String, CodingKey {
        case main, weather, wind, visibility
        case dtTxt = "dt_txt"
    }
}

// MARK: - MainClass
struct MainClass: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

// MARK: - WeatherElement
struct WeatherElement: Codable {
    let id: Int
    let main: MainEnum
    let description, icon: String
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
}
