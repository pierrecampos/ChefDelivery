//
//  HomeView.swift
//  ChefDelivery
//
//  Created by Pierre Campos Dias on 28/02/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isAnimating = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                Circle()
                    .foregroundStyle(.colorRed)
                    .frame(width: isAnimating ? 200 : 0)
                    .position(x: isAnimating ? 50 : -50 , y: isAnimating ? 100 : -100)
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 1)
                
                Circle()
                    .foregroundStyle(.colorRedDark)
                    .frame(width: isAnimating ? 200 : 0)
                    .position(
                        x: isAnimating ?  geometry.size.width - 50 : geometry.size.width  + 50,
                        y: isAnimating ? geometry.size.height - 50 : geometry.size.height + 50)
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 1)
                
                VStack {
                    Text("Chef Delivery")
                        .font(.system(size: 48))
                        .fontWeight(.heavy)
                        .foregroundStyle(.colorRed)
                        .opacity(isAnimating ? 1: 0)
                        .offset(y: isAnimating ? 0 : -40)
                    
                    Text("Peça as suas comidas favoritas no conforto da sua casa.")
                        .font(.title2)
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.black.opacity(0.7))
                        .opacity(isAnimating ? 1: 0)
                        .offset(y: isAnimating ? 0 : -40)
                    
                    Spacer()
                    
                }.onAppear {
                    withAnimation(.easeInOut(duration: 1)) {
                        isAnimating = true
                    }
                    
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
