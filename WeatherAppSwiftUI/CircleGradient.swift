//
//  CircleGradient.swift
//  WeatherAppSwiftUI
//
//  Created by Lukas Mauffré on 09/02/2020.
//  Copyright © 2020 Lukas Mauffré. All rights reserved.
//

import SwiftUI

struct CircleGradient: View {
    var body: some View {
        let colors = Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red])
        let conic = AngularGradient(gradient: colors, center: .center)
        return Circle()
        .fill(conic)
    }
}

struct CircleGradient_Previews: PreviewProvider {
    static var previews: some View {
        CircleGradient()
    }
}
