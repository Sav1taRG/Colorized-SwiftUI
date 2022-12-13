//
//  ContentView.swift
//  Colorized SwiftUI
//
//  Created by Roman on 13.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State var sliderRedValue = Double.random(in: 0...255)
    @State var sliderGreenValue = Double.random(in: 0...255)
    @State var sliderBlueValue = Double.random(in: 0...255)
    
    @State var redValueInput = ""
    @State var greenValueInput = ""
    @State var blueValueInput = ""
    
    var body: some View {
        VStack {
            SliderView(value: $sliderRedValue, inputValue: $redValueInput, textColor: .red)
            SliderView(value: $sliderGreenValue, inputValue: $greenValueInput, textColor: .green)
            SliderView(value: $sliderBlueValue, inputValue: $blueValueInput, textColor: .blue)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
