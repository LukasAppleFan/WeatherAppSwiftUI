//
//  AboutView.swift
//  WeatherAppWatch Extension
//
//  Created by Lukas Mauffré on 11/02/2020.
//  Copyright © 2020 Lukas Mauffré. All rights reserved.
//

import SwiftUI
import UIKit

struct AboutView: View {
    
    //    let generator = UINotificationFeedbackGenerator()
    
    @State private var degrees = 0
    
    @Binding var showAbout: Bool
    
    @ObservedObject var settingsVM = SettingsViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red, .purple]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            Form {
                
                Text("weatherAppIs")
                    .bold()
                    .multilineTextAlignment(.leading)
                
                Toggle(isOn: self.$settingsVM.isOn) {
                    Text("Beta")
                }
                
                Text("CorF")
                    .padding(.top)
                
                Picker(selection: $degrees, label: Text("CorFshort")) {
                    Text("°C").tag(0)
                    Text("°F").tag(1)
                }
                    .padding(.horizontal, 100)
                    .padding(.bottom)
                
                Section(header: Text("aboutTheApp").foregroundColor(.secondary).font(.caption)) {
                    HStack {
                        Text("appVersion")
                        Spacer()
                        Text("1.0").foregroundColor(.secondary)
                    }
                }
                
                VStack {
                    HStack(alignment: .center) {
                        Spacer()
                        Text("madeWithLove").font(.footnote).multilineTextAlignment(.center)
                        Spacer()
                    }
                    HStack(alignment: .center) {
                        Spacer()
                        Image("IMG_3953").resizable().frame(width: 100, height: 100, alignment: .center)
                        Spacer()
                    }
                    HStack {
                        Text("Copyright © 2020  Lukas")
                            .foregroundColor(.secondary)
                            .font(.caption)
                        Spacer()
                    }
                }.padding()
                
            }
            
        }
        .navigationBarTitle("done")
//        .navigationBarItems(leading:
//            Button(action: {
////                let impactLight = UIImpactFeedbackGenerator(style: .light)
////                impactLight.impactOccurred()
//                self.showAbout.toggle()
//            }) {
//                Text("done").font(.headline).bold()
//            }
//        )
        
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(showAbout: .constant(false))
    }
}
