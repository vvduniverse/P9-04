//
//  ContentView.swift
//  P9-04
//
//  Created by Vahtee Boo on 17.01.2022.
//

import SwiftUI

struct Flower: Shape {
    var petalOffset = -20.0
    var petalWidth = 100.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
            let rotation = CGAffineTransform(rotationAngle: number)
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            let originalPentl = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
            let rotatedPetal = originalPentl.applying(position)
            
            path.addPath(rotatedPetal)
        }
        
        return path
    }
}

struct ContentView: View {
    @State private var petalOffste = -20.0
    @State private var petalWidth = 100.0
    
    var body: some View {
        VStack {
            Flower(petalOffset: petalOffste, petalWidth: petalWidth)
                .fill(.red, style: FillStyle(eoFill: true))
//                .stroke(.red, lineWidth: 2)
//                .fill(.red)
            
            Text("Offset")
            Slider(value: $petalOffste, in: -40...40)
                .padding([.horizontal, .bottom])
            
            Text("Width")
            Slider(value: $petalWidth, in: 0...100)
                .padding(.horizontal)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
