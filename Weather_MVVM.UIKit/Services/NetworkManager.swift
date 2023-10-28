//
//  NetworkManager.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 21.10.2023.
//

import Foundation

enum API {
    case weatherURL(city: String)
    
    var url: URL {
        switch self {
        case .weatherURL(let city):
            let apiKey = "380a13ab79f381d11c50c917b4dbb7cf"
            let urlString = "https://api.openweathermap.org/data/2.5/forecast?appid=\(apiKey)&q=\(city)&units=metric"
            return URL(string: urlString) ?? URL(fileURLWithPath: "")
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    //MARK: - Fetch Methods
    
    func fetch<T: Decodable>(_ type: T.Type, from url: URL, completion: @escaping(Result<T, NetworkError>) -> Void) {
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data else {
                    completion(.failure(.noData))
                    print(error?.localizedDescription ?? "No error Description")
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let dataModel = try decoder.decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(dataModel))
                    }
                } catch {
                    completion(.failure(.decodingError))
                }
            }.resume()
        }
}

