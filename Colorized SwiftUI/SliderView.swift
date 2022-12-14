//
//  SliderView.swift
//  Colorized SwiftUI
//
//  Created by Roman on 13.12.2022.
//

import SwiftUI

struct SliderView: View {
    @Binding var value: Double
    @Binding var inputValue: String
    
    @State private var showAlert = false
    
    @FocusState var fieldIsFocused: Bool
    
    let sliderTint: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))").foregroundColor(Color(.systemGray))
                .frame(width: 40, height: 40)
            Slider(value: $value, in: 0...255, step: 1)
                .onChange(of: value) { _ in
                    inputValue = "\(lround(value))"
                }
                .tint(sliderTint)
            TextField("", text: $inputValue) {_ in
                checkValue()
            }
                .bordered()
                .multilineTextAlignment(.trailing)
                .frame(width: 65, height: 40)
                .keyboardType(.numberPad)
                .focused($fieldIsFocused)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Wrong format"),
                          message: Text("Please enter values to 0 from 255")
                    )
                }
        }
        .onAppear {
            inputValue = "\(lround(value))"
        }
    }
    
    private func checkValue() {
        if let value = Int(inputValue), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        value = 0
        showAlert.toggle()
    }
}

//struct SliderView_Previews: PreviewProvider {
//    static var previews: some View {
//        SliderView(value: 10.0, inputValue: $inputValue, textColor: .red)
//    }
//}
