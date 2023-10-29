//
//  Bindable.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 26.10.2023.
//

import Foundation

final class DateTimeFormatter {
    static func formatTime(from dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        guard let date = dateFormatter.date(from: dateString) else {
            return "Invalid Time"
        }

        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "dd.MM, HH:mm"

        return timeFormatter.string(from: date)
    }
}

