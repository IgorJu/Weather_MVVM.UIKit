//
//  ViewController.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 21.10.2023.
//

import UIKit
import Combine

private enum Heights {
    static let small = 70.0
    static let large = 200.0
}

final class WeatherViewController: UIViewController {
    
    //MARK: - Properties
    
    private var subscriptions = Set<AnyCancellable>()
    
    private let tableView = UITableView()
    private var spinnerView = UIActivityIndicatorView()
    
    private var hourViewModels: [HourlyWeatherViewModel] = []
    
    private let networkManager = NetworkManager.shared
    private let locationManager = LocationManager.shared
    
    let viewModel = CurrentWeatherViewModel()
    var selectedCity: City?
    
    //MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isTranslucent = true
        tabBarController?.tabBar.backgroundColor = UIColor.clear
        setupGradient()
        setTableView()
        showSpinner(in: view)
        setConstraints()
        getLocation()
    }
    
    //MARK: - Flow
    
    private func showSpinner(in view: UIView) {
        spinnerView = UIActivityIndicatorView(style: .large)
        spinnerView.color = .white
        spinnerView.startAnimating()
        spinnerView.center = view.center
        spinnerView.hidesWhenStopped = true
        view.addSubview(spinnerView)
    }
    
    private func getLocation() {
        viewModel.weather
            .sink { [weak self] weather in
                DispatchQueue.main.async {
                    self?.hourViewModels = weather?.list.map { HourlyWeatherViewModel(hourWeather: $0) } ?? []
                    self?.tableView.reloadData()
                }
            }
            .store(in: &subscriptions)
        
        DispatchQueue.global().async {
            
            if self.selectedCity == nil {
                self.viewModel.getWeatherBylocation()
            } else {
                guard let selectedCity = self.selectedCity else { return }
                self.viewModel.getWeatherByCity(selectedCity.name)
            }
            
            DispatchQueue.main.async {
                self.spinnerView.stopAnimating()
            }
            
        }
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
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0
        ? 1
        : viewModel.weather.value?.list.count ?? 0
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return Heights.large
        } else {
            return Heights.small
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

