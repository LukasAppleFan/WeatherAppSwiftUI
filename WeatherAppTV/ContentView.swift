//
//  ContentView.swift
//  WeatherAppTV
//
//  Created by Lukas Mauffré on 11/02/2020.
//  Copyright © 2020 Lukas Mauffré. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    
    @State var showAbout = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    NavigationLink(destination: AboutView()) {
                        Image(systemName: "info.circle")
                            .imageScale(.medium)
                            .font(.title)
                            .frame(width: 20, height: 20)
                            //                            .foregroundColor(Color(red: 148/255, green: 0/255, blue: 211/255))
                            .foregroundColor(.white)
                            .padding()
                            .background(CircleGradient())
                    }
                    
                    Spacer()
                    
                    Text("WeatherApp").font(.title).bold()
                    
                    Spacer()
                    
                    Image(systemName: "sun.max")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .imageScale(.large)
                }.padding([.top, .horizontal], 20)
                
                
                
                List {
                    HStack {
                        Spacer()
                        Text("18°C").font(.system(.largeTitle, design: .rounded)).foregroundColor(.white)
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        Text("Paris")
                            .foregroundColor(.white)
                            .font(.system(.title, design: .rounded))
                            .bold()
                            .padding()
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        Text("sunny")
                            .foregroundColor(.white)
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.medium)
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        Text("weatherForecast")
                            .bold()
                            .padding(.top, 40)
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        Image(systemName: "sun.max.fill")
                            .font(.largeTitle)
                            .imageScale(.large)
                            .frame(width: 50, height: 50)
                            .padding(.trailing, 10)
                        VStack(alignment: .leading, spacing: 5) {
                            Text("sunny")
                            Text("minTemp")
                                .fontWeight(.medium)
                            Text("maxTemp")
                                .fontWeight(.medium)
                        }
                        Spacer()
                    }.padding(.vertical)
                    
                    HStack {
                        Spacer()
                        Image(systemName: "cloud.fill")
                            .font(.largeTitle)
                            .imageScale(.large)
                            .frame(width: 50, height: 50)
                            .padding(.trailing, 10)
                        VStack(alignment: .leading, spacing: 5) {
                            Text("cloudy")
                            Text("minTemp")
                                .fontWeight(.medium)
                            Text("maxTemp")
                                .fontWeight(.medium)
                        }
                        Spacer()
                    }.padding(.vertical)
                    
                    HStack {
                        Spacer()
                        Image(systemName: "sunset.fill")
                            .font(.largeTitle)
                            .imageScale(.large)
                            .frame(width: 50, height: 50)
                            .padding(.trailing, 10)
                        VStack(alignment: .leading, spacing: 5) {
                            Text("sunset")
                            Text("minTemp")
                                .fontWeight(.medium)
                            Text("maxTemp")
                                .fontWeight(.medium)
                        }
                        Spacer()
                    }.padding(.vertical)
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
