//
//  HapticWatchView.swift
//  WeatherAppWatch Extension
//
//  Created by Lukas Mauffré on 11/02/2020.
//  Copyright © 2020 Lukas Mauffré. All rights reserved.
//

import SwiftUI

struct HapticWatchView: View {
    var body: some View {
        List {
            Button(action: {
                WKInterfaceDevice.current().play(.click)
            }) {
                Text("Click")
            }
            
            Button(action: {
                WKInterfaceDevice.current().play(.directionDown)
            }) {
                Text("Direction down")
            }
            
            Button(action: {
                WKInterfaceDevice.current().play(.directionUp)
            }) {
                Text("Direction up")
            }
            
            Button(action: {
                WKInterfaceDevice.current().play(.failure)
            }) {
                Text("Failure")
            }
            
            Button(action: {
                WKInterfaceDevice.current().play(.notification)
            }) {
                Text("Notification")
            }
            
            Button(action: {
                WKInterfaceDevice.current().play(.retry)
            }) {
                Text("Retry")
            }
            
            Button(action: {
                WKInterfaceDevice.current().play(.start)
            }) {
                Text("Start")
            }
            
            Button(action: {
                WKInterfaceDevice.current().play(.stop)
            }) {
                Text("Stop")
            }
            
            Button(action: {
                WKInterfaceDevice.current().play(.success)
            }) {
                Text("Success")
            }
        }
        .navigationBarTitle("Haptics")
    }
}

struct HapticWatchView_Previews: PreviewProvider {
    static var previews: some View {
        HapticWatchView()
    }
}
