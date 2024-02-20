//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Pierre Campos Dias on 19/02/24.
//

import SwiftUI

struct StoreDetailView: View {
    
    var store: StoreType
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(store.headerImage)
                .resizable()
                .scaledToFit()
            
            HStack {
                Text(store.name)
                    .font(.title)
                    .bold()
                
                Spacer()
                
                Image(store.logoImage)
            }
            .padding(.vertical, 8)
            .padding()
            
            HStack {
                Text(store.location)
                
                Spacer()
                
                ForEach(1...store.stars, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                        .font(.caption)
                }
            }
            .padding(.vertical, 8)
            .padding()
            
            Text("Produtos")
                .font(.title2)
                .bold()
                .padding()
        }
        .navigationTitle(store.name)
    }
}

#Preview {
    StoreDetailView(store: storesMock[0])
}
