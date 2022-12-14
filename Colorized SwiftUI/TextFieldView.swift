//
//  TextFieldView.swift
//  Colorized SwiftUI
//
//  Created by Roman Golubinko on 14.12.2022.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var value: Double
    @Binding var inputValue: String
    
    @State private var showAlert = false
    
    @FocusState var fieldIsFocused: Bool
    
    var body: some View {
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
    private func checkValue() {
        if let value = Int(inputValue), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        value = 0
        showAlert.toggle()
    }
}
