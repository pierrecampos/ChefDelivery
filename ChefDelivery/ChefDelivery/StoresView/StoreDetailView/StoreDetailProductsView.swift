//
//  StoreDetailProductsView.swift
//  ChefDelivery
//
//  Created by Pierre Campos Dias on 27/02/24.
//

import SwiftUI

struct StoreDetailProductsView: View {
    
    @EnvironmentObject var store: StoreType
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Produtos")
                .font(.title2)
                .bold()
                .padding()
            
            ForEach(store.products) { product in
                Button(action: {
                    selectedProduct = product
                }, label: {
                    StoreDetailProductItemView(product: product)
                })
                .sheet(item: $selectedProduct) { product in
                    ProductDetailView(product: product)
                }
            }
        }
    }
}

#Preview {
    StoreDetailProductsView()
        .environmentObject(storesMock[0])
}
