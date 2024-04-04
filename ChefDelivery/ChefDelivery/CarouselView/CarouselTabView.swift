//
//  CarouselTabView.swift
//  ChefDelivery
//
//  Created by Pierre Campos Dias on 17/02/24.
//

import SwiftUI

struct CarouselTabView: View {
    
    // MARK: - Attributes
    @State private var currentId = bannerMocks[0].id
    
    var body: some View {
        TabView(selection: $currentId) {
            ForEach(bannerMocks) { mock in
                CarouselItemView(order: mock)
                    .tag(mock.id)
            }
        }
        .frame(height: 180)
        .tabViewStyle(.page)
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                withAnimation(.easeInOut(duration: 1)) {
                    var currentIndex = bannerMocks.firstIndex { $0.id == currentId } ?? 0
                    currentIndex = currentIndex >= bannerMocks.count - 1 ? 0 : currentIndex + 1
                    currentId = bannerMocks[currentIndex].id
                }                
            }
        }
    }
}

#Preview {
    CarouselTabView()
}
