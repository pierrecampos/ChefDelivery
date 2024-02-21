//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Pierre Campos Dias on 19/02/24.
//

import SwiftUI

struct StoreDetailView: View {
    
    var store: StoreType
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        ScrollView(showsIndicators: false) {
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
                .padding(.horizontal)
                
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
                
                ForEach(store.products) { product in
                    Button(action: {
                        selectedProduct = product
                    }, label: {
                        HStack(spacing: 8) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(product.name)
                                    .bold()
                                
                                Text(product.description)
                                    .foregroundStyle(.black.opacity(0.5))
                                    .multilineTextAlignment(.leading)
                                
                                Text(product.price.formatToCurrency())
                            }
                            
                            Spacer()
                            
                            Image(product.image)
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .frame(width: 120, height: 120)
                                .shadow(color: .black.opacity(0.3), radius: 20, x: 6, y: 8)
                        }
                        .padding()
                        .foregroundStyle(.black)
                    })
                    .sheet(item: $selectedProduct) { product in
                        ProductDetailView(product: product)
                    }
                }
                
            }
            .navigationTitle(store.name)
            .navigationBarBackButtonHidden()
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        HStack(spacing: 4) {
                            Image(systemName: "cart")
                            Text("Lojas")
                        }.foregroundStyle(.colorRed)
                    })
                }
            })
        }
    }
}

#Preview {
    StoreDetailView(store: storesMock[0])
}
