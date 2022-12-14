//
//  ContentView.swift
//  Colorized SwiftUI
//
//  Created by Roman on 13.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderRedValue = Double.random(in: 0...255)
    @State private var sliderGreenValue = Double.random(in: 0...255)
    @State private var sliderBlueValue = Double.random(in: 0...255)
    
    @State private var redValueInput = ""
    @State private var greenValueInput = ""
    @State private var blueValueInput = ""
    
    @FocusState private var fieldIsFocused: Bool
    
    var body: some View {
        let viewColor = Color(
            red: sliderRedValue / 255,
            green: sliderGreenValue / 255,
            blue: sliderBlueValue / 255
        )
        
        VStack(spacing: 15) {
            ColorRectangleView(color: viewColor)
            SliderView(value: $sliderRedValue,
                       inputValue: $redValueInput,
                       fieldIsFocused:_fieldIsFocused,
                       sliderTint: .red)
            SliderView(value: $sliderGreenValue,
                       inputValue: $greenValueInput,
                       fieldIsFocused: _fieldIsFocused,
                       sliderTint: .green)
            SliderView(value: $sliderBlueValue,
                       inputValue: $blueValueInput,
                       fieldIsFocused: _fieldIsFocused,
                       sliderTint: .blue)
            Spacer()
        }
        .padding()
        
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done", action: applyValue)
            }
        }
        .onTapGesture {
            applyValue()
        }
    }
    
    private func applyValue() {
        fieldIsFocused = false
        
        sliderRedValue = Double(redValueInput) ?? sliderRedValue
        sliderGreenValue = Double(greenValueInput) ?? sliderGreenValue
        sliderBlueValue = Double(blueValueInput) ?? sliderBlueValue
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BorderedViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(lineWidth: 1)
                    .foregroundColor(Color(.systemGray))
            )
            .shadow(color: Color.gray.opacity(0.4), radius: 1, x: 1, y: 2)
            .accentColor(Color(.systemGray))
    }
}
extension TextField {
    func bordered() -> some View {
        ModifiedContent(
            content: self,
            modifier: BorderedViewModifier()
        )
    }
}
