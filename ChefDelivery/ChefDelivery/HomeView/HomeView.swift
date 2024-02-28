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

#Preview {
    HomeView()
}
