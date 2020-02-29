//
//  SettingsViewModel.swift
//  WeatherAppWatch Extension
//
//  Created by Lukas Mauffré on 11/02/2020.
//  Copyright © 2020 Lukas Mauffré. All rights reserved.
//

import Foundation

class SettingsViewModel: ObservableObject {
    
    @Published var isOn: Bool = UserDefaults.standard.bool(forKey: "isOn") {
        didSet {
            UserDefaults.standard.set(self.isOn, forKey: "isOn")
        }
    }
    
}
