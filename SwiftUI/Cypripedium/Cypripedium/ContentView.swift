//
//  ContentView.swift
//  Cypripedium
//
//  Created by Komeno on 2024/01/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("cypripedium")
                .roundImage(cornerRadius: 12)
            Text("Cypripedium")
                .font(.title)
                .fontWeight(.bold)
        }
        .padding()
    }
}

extension Image {
    func roundImage(cornerRadius: CGFloat) -> some View {
        self
            .resizable()
            .scaledToFit()
            .clipShape(
                RoundedRectangle(cornerRadius: cornerRadius)
            )
            .shadow(color: .black, radius: 10, x: 0, y: 3)
    }
}

#Preview {
    ContentView()
}
