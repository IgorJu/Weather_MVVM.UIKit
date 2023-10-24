//
//  SettingsViewViewModel.swift
//  Weather_MVVM.UIKit
//
//  Created by Igor on 24.10.2023.
//

import Foundation

struct SettingsViewViewModel {
    let options: [SettingOption]
}

enum SettingOption: CaseIterable {
    case upgrade
    case privacyPolicy
    case terms
    case contact
    case getHelp
    case rateApp
    
    var title: String {
        switch self {
        case .upgrade:
            return "Upgrade to Pro "
        case .privacyPolicy:
            return "Privacy policy"
        case .terms:
           return "Terms"
        case .contact:
            return "contact us"
        case .getHelp:
            return "getHelp"
        case .rateApp:
            return "rate app"
        }
    }
}
