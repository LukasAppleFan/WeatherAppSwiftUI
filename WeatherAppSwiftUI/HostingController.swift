//
//  HostingController.swift
//  WeatherAppSwiftUI
//
//  Created by Lukas Mauffré on 09/02/2020.
//  Copyright © 2020 Lukas Mauffré. All rights reserved.
//

import SwiftUI

class HostingController: UIHostingController<ContentView> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
