//
//  SwiftUIView.swift
//  DunyaGezgini
//
//  Created by Umut Gultekin on 19.10.2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    static var regions:[MKCoordinateRegion] = [
    
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 41, longitude: 29),
            span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
        ),
        
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.50, longitude: -0.11),
            span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
        )
    ]
    
    @State var region: MKCoordinateRegion = regions[0]
    
    @State var selectedIndex = 0
    
    var body: some View {
        
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.top)
            .overlay(
                VStack{
                    Picker("Title", selection: $selectedIndex, content: {
                        Text("MAP_CITY_ISTANBUL").tag(0)
                        Text("MAP_CITY_LONDON").tag(1)
                    })
                        .pickerStyle(.segmented)
                        .padding()
                        .onChange(of: selectedIndex) { newValue in
                            self.region = MapView.regions[selectedIndex]
                        }
                    
                    Spacer()
                }
            )
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
