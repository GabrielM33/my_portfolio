//
//  CircleGroupVIew.swift
//  Restart
//
//  Created by Gabriel Moraes on 30/4/2023.
//

import SwiftUI

struct CircleGroupVIew: View {
    
    // MARK: PROPERTY
    
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State private var isAnimating: Bool = false
        
    // MARK: BODY
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        } // ZSTACK
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

// MARK: - PREVIEW

struct CircleGroupVIew_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
                Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            CircleGroupVIew(ShapeColor: .white, ShapeOpacity: 0.2)
        }
    }
}
