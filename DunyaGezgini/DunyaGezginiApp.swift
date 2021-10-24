//
//  DunyaGezginiApp.swift
//  DunyaGezgini
//
//  Created by Umut Gultekin on 11.10.2021.
//

import SwiftUI

@main
struct DunyaGezginiApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                    .tabItem {
                        HStack{
                            Image(systemName: "thermometer")
                            Text("TAB_TEMPRETURE")
                        }
                    }
                MapView()  .tabItem {
                    HStack{
                        Image(systemName: "map")
                        Text("TAB_MAP")
                    }
                    
                }
            }
            .accentColor(.purple)
            
        }
    }
}
