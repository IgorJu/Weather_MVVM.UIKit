//
//  ViewController.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 21.10.2023.
//

import UIKit

final class WeatherViewController: UIViewController {

    private let tableView = UITableView()
    private let viewModel = CurrentWeatherViewModel()
    private var hourViewModels = [HourlyWeatherViewModel]()
    
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setConstraints()
        viewModel.getLocation()
        viewModel.weather?.bind({ weather in
            self.fetchWeather(currentWeather: weather)
        })
        
    }

    private func fetchWeather(currentWeather: CurrentWeather) {
        
        WeatherManager.shared.getCurrentWeather(completion: { [weak self] weather in
            self?.viewModel.weather?.value = weather
            self?.hourViewModels = weather.hourWeather.map { HourlyWeatherViewModel(hourWeather: $0) }
       })

    }
    private func setTableView() {
         tableView.register(
             CurrentWeatherCell.self,
             forCellReuseIdentifier: CurrentWeatherCell.identifier
         )
        tableView.register(
            HourlyWeatherCell.self,
            forCellReuseIdentifier: HourlyWeatherCell.identifier
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
         tableView.backgroundColor = .clear
         tableView.dataSource = self
         tableView.delegate = self
        view.addSubview(tableView)
     }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

//MARK: - UiTableViewDataSource, UiTableViewDelegate
extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0
        ? 1
        : viewModel.weather?.value.hourWeather.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CurrentWeatherCell.identifier,
                for: indexPath
            ) as? CurrentWeatherCell else { return UITableViewCell() }
            cell.configure(with: viewModel)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: HourlyWeatherCell.identifier,
                for: indexPath
            ) as? HourlyWeatherCell else { return UITableViewCell() }
            cell.configure(with: hourViewModels[indexPath.row])
            return cell
        }
        
    }
    
    
}

