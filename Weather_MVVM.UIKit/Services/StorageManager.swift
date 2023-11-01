//
//  StorageManager.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 01.11.2023.
//

import Foundation
//
//protocol IStorageManager {
//    func saveCity(_ city: City)
//
//    func loadCities() -> [City]?
//}

final class StorageManager {
    
    static let shared = StorageManager()
    
    private init() {}
    
    func saveCities(_ cities: [City]) {
        UserDefaults.standard.set(encodable: cities, forKey: .cities)
    }
    
    func loadCities() -> [City]? {
        guard let cities = UserDefaults.standard.object([City].self, forKey: .cities) else { return []}
        return cities
    }
    
}


extension UserDefaults {
    func set<T: Encodable>(encodable: T, forKey key: String) {
        if let data = try? JSONEncoder().encode(encodable) {
            set(data, forKey: key)
        }
    }
    
    func object<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        if let data = object(forKey: key) as? Data,
           let value = try? JSONDecoder().decode(type, from: data) {
            return value
        }
        return nil
    }
}
