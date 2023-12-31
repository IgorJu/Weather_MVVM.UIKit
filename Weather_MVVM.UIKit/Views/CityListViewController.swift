//
//  SettingsViewController.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 21.10.2023.
//

import UIKit

final class CityListViewController: UIViewController {
    
    //MARK: - Properties
    
    private let viewModel = CitiesViewModel()
    private let searchBar = UITextField()
    
    private var searchResults: [City] = []
    private var existedCities: [City] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let storageManager = StorageManager.shared
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradient()
        fetchCityList()
        setSearchBar()
        setupTableView()
    }
    
    //MARK: - Flow
    
    private func fetchCityList() {
        DispatchQueue.global().async {
            if let loadedCities = self.storageManager.loadCities() {
                DispatchQueue.main.async {
                    self.existedCities = loadedCities
                    self.tableView.reloadData()
                }
            }
        }
    }

    private func setSearchBar() {
        searchBar.placeholder = "Поиск городов"
        searchBar.textColor = .white
        searchBar.backgroundColor = .clear
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.addTarget(self, action: #selector(searchBarTextChanged), for: .editingChanged)
        
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Sizes.regular),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Sizes.regular),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Sizes.regular)
        ])
    }
    
    @objc private func searchBarTextChanged(_ textField: UITextField) {
        guard let searchText = textField.text, !searchText.isEmpty else { return }
        searchResults = viewModel.searchCity(withName: searchText)
        
        tableView.reloadData()
    }
        
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.register(CityCell.self, forCellReuseIdentifier: CityCell.identifier)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: Sizes.small),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func addCity(_ city: City) {
        viewModel.addCity(city)
        existedCities = viewModel.loadCities()
        existedCities.append(city)
        searchBar.text = ""
        
        searchResults = existedCities.compactMap { addedCity in
            viewModel.cities.first(where: { $0.name == addedCity.name })
        }
        
        tableView.reloadData()
    }
    
    private func showWeather(for city: City) {
        let weatherVC = WeatherViewController()
        weatherVC.selectedCity = city
        navigationController?.pushViewController(weatherVC, animated: true)
    }
}

//MARK: - UITableViewDelegate, DataSource

extension CityListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CityCell.identifier,
            for: indexPath
        ) as? CityCell else { return UITableViewCell() }
        
        cell.configure(city: searchResults[indexPath.row]) { [weak self] city in
            self?.addCity(city)
            tableView.reloadData()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCity = searchResults[indexPath.row]
        showWeather(for: selectedCity)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
