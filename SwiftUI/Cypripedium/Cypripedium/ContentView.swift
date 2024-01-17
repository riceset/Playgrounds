//
//  ContentView.swift
//  Cypripedium
//
//  Created by Komeno on 2024/01/15.
//

import SwiftUI

func swapValues<T>(_ x: inout T, _ y: inout T) {
    let tmp: T
    
    tmp = x
    x = y
    y = tmp
}

struct ContentView: View {
    @State private var x = 4
    @State private var y = 5
    
    var body: some View {
        VStack {
            BoxView("\(x)")
            BoxView("\(y)")
            
            Button("Swap") {
                withAnimation {
                    swapValues(&x, &y)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
