//
//  TemperatureFormatter.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 29.10.2023.
//

import Foundation

func roundToIntAndString(_ temperature: Double) -> String {
        String(Int((round(temperature)))) + "°"
        
    }

