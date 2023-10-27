//
//  HourlyWeatherView.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 27.10.2023.
//

import UIKit

protocol HourlyWeatherDelegate: AnyObject {
    func settingsView(_ view: HourWeatherView, didTap option: SettingOption)
}

final class HourWeatherView: UIView {
    
    weak var delegate: HourlyWeatherDelegate?
    
    private var  viewModel: CurrentWeatherViewModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let tableView: UITableView  = {
        let table = UITableView()
        table.register(
            HourlyWeatherTableViewCell.self,
            forCellReuseIdentifier: HourlyWeatherTableViewCell.cellIdentifier
        )
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor)
            
        ])

    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func configure(with viewModel: CurrentWeatherViewModel) {
        self.viewModel = viewModel
    }
}

extension HourWeatherView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.weather?.value.hourWeather.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(
            withIdentifier: HourlyWeatherTableViewCell.cellIdentifier,
            for: indexPath
       ) as? HourlyWeatherTableViewCell else { return UITableViewCell() }
        cell.configure(with: <#T##HourlyWeatherViewModel#>)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let viewModel else { return }
        
        let option = viewModel.options[indexPath.row]
        delegate?.settingsView(self, didTap: option)
    }
    
    
}
