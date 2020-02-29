//
//  CircleShapeStyle.swift
//  WeatherAppSwiftUI
//
//  Created by Lukas Mauffré on 09/02/2020.
//  Copyright © 2020 Lukas Mauffré. All rights reserved.
//

import SwiftUI

struct CircleShapeStyle: View {
    var body: some View {
        let colors = Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red])
        let conic = AngularGradient(gradient: colors, center: .center, startAngle: .zero, endAngle: .degrees(360))
        return Circle()
            .strokeBorder(conic, lineWidth: 50)
    }
}

struct CircleShapeStyle_Previews: PreviewProvider {
    static var previews: some View {
        CircleShapeStyle()
    }
}
