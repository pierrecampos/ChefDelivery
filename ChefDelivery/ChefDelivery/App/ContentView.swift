//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Pierre Campos Dias on 15/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationBar()
            .padding(.horizontal, 15)
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                OrderTypeGridView()
                CarouselTabView()
            }
            
        }
    }
}

#Preview {
    ContentView()
}
