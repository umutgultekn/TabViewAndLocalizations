//
//  ContentView.swift
//  DunyaGezgini
//
//  Created by Umut Gultekin on 11.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var fahrenheitValue: String = ""
    
    @State var isVisible = false
    
    let numberFormatter : NumberFormatter = {
        
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        
        return numberFormatter
        
    }()
    
    
    func convertCelcius() -> String {
        
        if let value = Double(fahrenheitValue) {
            
            let fahrenheit = Measurement<UnitTemperature>(value: value, unit: .fahrenheit)
            
            let celciusValue = fahrenheit.converted(to: .celsius)
            
            return numberFormatter.string(from: NSNumber(value: celciusValue.value)) ?? "???"
            
                
        } else {
            return "???"
        }
        
    }
    
    var body: some View { 
        VStack{
            TextField("TEMPRETURE_TEXT_FIELD_PLACEHOLDER", text: $fahrenheitValue)
                .keyboardType(.decimalPad)
                .font(Font.system(size: 64))
                .multilineTextAlignment(.center)
            
            Text("TEMPRETURE_FAHRENHEIT")
 
            Text("TEMPRETURE_IS_ACTUALLY").foregroundColor(.gray)
            
            Text(convertCelcius())
            
            Text("TEMPRETURE_DEGREES_CELCIUS")
            
            Spacer()
        }
        .foregroundColor(.orange)
        .font(.title)
        .opacity(isVisible ? 1.0 : 0.0)
        .offset(x: 0, y: isVisible ? 0 : 20)
        .animation(.easeIn(duration: 1))
        .onAppear {
            isVisible = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
