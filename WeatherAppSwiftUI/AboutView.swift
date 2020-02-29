//
//  AboutView.swift
//  WeatherAppSwiftUI
//
//  Created by Lukas Mauffré on 09/02/2020.
//  Copyright © 2020 Lukas Mauffré. All rights reserved.
//

import SwiftUI
import SafariServices
import MessageUI
import UIKit

struct AboutView: View {
    
    let generator = UINotificationFeedbackGenerator()
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    
    @State var showInsta = false
    @State var showTwitter = false
    @State var isShowingMailView = false
    @State var showAPIwebsite = false
    
    @State private var degrees = 0
    
    @Binding var showAbout: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.red, .purple]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                
                Form {
                    
                    Text("weatherAppIs")
                        .bold()
                        .multilineTextAlignment(.leading)
                    
                    
                    Text("CorF")
                        .padding(.top)
                    
                    Picker(selection: $degrees, label: Text("CorFshort")) {
                        Text("°C").tag(0)
                        Text("°F").tag(1)
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal, 100)
                        .padding(.bottom)
                    
                    
                    
                    Section(header: Text("socialNetworks").foregroundColor(.secondary).font(.caption), footer: Text("followMe").foregroundColor(.secondary)) {
                        
                        Button(action: {
                            let impactLight = UIImpactFeedbackGenerator(style: .light)
                            impactLight.impactOccurred()
                            self.showInsta.toggle()
                        }) {
                            HStack {
                                Text("Instagram").padding().foregroundColor(.white).background(LinearGradient(gradient: .init(colors: [.orange,.red]), startPoint: .leading, endPoint: .trailing))
                                    .cornerRadius(20)
                                
                                Spacer()
                                
                                Text("@lukasapplefan").foregroundColor(.secondary).font(.subheadline).multilineTextAlignment(.trailing)
                            }
                        }.sheet(isPresented: $showInsta) {
                            instagram().edgesIgnoringSafeArea(.all)
                        }
                        
                        Button(action: {
                            let impactLight = UIImpactFeedbackGenerator(style: .light)
                            impactLight.impactOccurred()
                            self.showTwitter.toggle()
                        }) {
                            HStack {
                                Text("Twitter").padding().foregroundColor(.white).background(LinearGradient(gradient: .init(colors: [.purple,.blue]), startPoint: .leading, endPoint: .trailing))
                                    .cornerRadius(20)
                                
                                Spacer()
                                
                                Text("@lukasapplefan").foregroundColor(.secondary).font(.subheadline).multilineTextAlignment(.trailing)
                            }
                        }.sheet(isPresented: $showTwitter) {
                            twitter().edgesIgnoringSafeArea(.all)
                        }
                        
                        Button(action: {
                            let impactLight = UIImpactFeedbackGenerator(style: .light)
                            impactLight.impactOccurred()
                            self.isShowingMailView.toggle()
                        }) {
                            HStack {
                                Text("emailMe").padding().foregroundColor(.white).background(LinearGradient(gradient: .init(colors: [.green,.yellow]), startPoint: .leading, endPoint: .trailing))
                                    .cornerRadius(20)
                                
                                Spacer()
                                
                                Text("lukasapplefan@gmail.com").foregroundColor(.secondary).font(.subheadline).multilineTextAlignment(.trailing)
                            }
                        }
                        .disabled(!MFMailComposeViewController.canSendMail())
                        .sheet(isPresented: $isShowingMailView) {
                            MailView(result: self.$result).edgesIgnoringSafeArea(.all)
                        }
                        
                    }
                    
                    Section(header: Text("aboutTheApp").foregroundColor(.secondary).font(.caption)) {
                        HStack {
                            Text("appVersion")
                            Spacer()
                            Text("1.0").foregroundColor(.secondary)
                        }
                    }
                    
                    Section(header: Text("credits").foregroundColor(.secondary).font(.caption)) {
                        Button(action: {
                            let impactLight = UIImpactFeedbackGenerator(style: .light)
                            impactLight.impactOccurred()
                            self.showAPIwebsite.toggle()
                        }) {
                            HStack {
                                Text("API_NAME").foregroundColor(.white)
                                Spacer()
                                Text("API_WEBSITE")
                                    .foregroundColor(.secondary)
                                    .font(.subheadline)
                                    .multilineTextAlignment(.trailing)
                            }
                        }.sheet(isPresented: $showAPIwebsite) {
                            apiWebsite().edgesIgnoringSafeArea(.all)
                        }
                    }
                    
                    
                    VStack {
                        HStack(alignment: .center) {
                            Spacer()
                            Text("madeWithLove").font(.system(.footnote, design: .monospaced)).multilineTextAlignment(.center)
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
            .navigationBarTitle("about", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    let impactLight = UIImpactFeedbackGenerator(style: .light)
                    impactLight.impactOccurred()
                    self.showAbout.toggle()
                }) {
                    Text("done").font(.headline).bold()
                }
            )
        }.environment(\.horizontalSizeClass, .compact)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(showAbout: .constant(false))
    }
}

struct instagram : UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<instagram>) -> SFSafariViewController {
        let controller = SFSafariViewController(url: URL(string: "https://www.instagram.com/lukasapplefan/")!)
        return controller
    }
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<instagram>) {
        
    }
}

struct twitter : UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<twitter>) -> SFSafariViewController {
        let controller = SFSafariViewController(url: URL(string: "https://twitter.com/lukasapplefan")!)
        return controller
    }
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<twitter>) {
        
    }
}

struct MailView: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        
        @Binding var presentation: PresentationMode
        @Binding var result: Result<MFMailComposeResult, Error>?
        
        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _presentation = presentation
            _result = result
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            defer {
                $presentation.wrappedValue.dismiss()
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(presentation: presentation,
                           result: $result)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.setToRecipients(["lukasapplefan@gmail.com"])
        vc.setSubject("WeatherApp")
        vc.setMessageBody("WeatherApp", isHTML: true)
        vc.mailComposeDelegate = context.coordinator
        return vc
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {
        
    }
}

struct apiWebsite : UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<apiWebsite>) -> SFSafariViewController {
        let controller = SFSafariViewController(url: URL(string: "https://www.google.com")!)
        return controller
    }
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<apiWebsite>) {
        
    }
}
