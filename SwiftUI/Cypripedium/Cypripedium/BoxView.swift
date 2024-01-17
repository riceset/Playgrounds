//
//  BoxView.swift
//  Cypripedium
//
//  Created by Komeno on 2024/01/17.
//

import SwiftUI

struct BoxView: View {
    var content: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill()
            Text(content)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
        }
        .padding()
        .shadow(radius: 20)
    }
    
    init(_ content: String) {
        self.content = content
    }
}

#Preview {
    BoxView("test")
}
