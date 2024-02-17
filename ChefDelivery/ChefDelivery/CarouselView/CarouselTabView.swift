//
//  CarouselTabView.swift
//  ChefDelivery
//
//  Created by Pierre Campos Dias on 17/02/24.
//

import SwiftUI

struct CarouselTabView: View {
    var body: some View {
        TabView {
            ForEach(bannerMocks) { mock in
                CarouselItemView(order: mock)
            }
        }
        .frame(height: 180)
        .tabViewStyle(.page)
    }
}

#Preview {
    CarouselTabView()
}
