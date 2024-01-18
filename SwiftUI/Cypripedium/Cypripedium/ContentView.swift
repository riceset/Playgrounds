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
        VStack(spacing: 20) {
            Text("Tap the button to swap values")
                .font(.headline)
                .foregroundColor(.secondary)
            
            HStack(spacing: 20) {
                ValueBoxView(value: $x, label: "X", color: .blue)
                ValueBoxView(value: $y, label: "Y", color: .green)
            }
            .padding(.horizontal)
            
            Button(action: {
                withAnimation {
                    swap(&x, &y)
                }
            }) {
                Label("Swap", systemImage: "arrow.left.arrow.right")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.accentColor))
            }
            .padding()
        }
    }
}

struct ValueBoxView: View {
    @Binding var value: Int
    let label: String
    let color: Color

    var body: some View {
        VStack {
            Text(label)
                .font(.caption)
                .foregroundColor(color)
            Text("\(value)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(color)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.systemBackground)))
        .shadow(color: color.opacity(0.3), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    ContentView()
}
