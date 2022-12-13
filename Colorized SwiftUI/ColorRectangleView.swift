//
//  ColorRectangleView.swift
//  Colorized SwiftUI
//
//  Created by Roman on 13.12.2022.
//

import SwiftUI

struct ColorRectangleView: View {
    let color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(color)
            .frame(height: 200)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 2)
                .foregroundColor(Color(.systemGray))
            )
            .padding()
    }
}

struct ColorRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        ColorRectangleView(color: .red)
    }
}
