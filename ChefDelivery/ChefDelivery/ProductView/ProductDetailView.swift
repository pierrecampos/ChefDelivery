//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Pierre Campos Dias on 21/02/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    var product: ProductType
    
    var body: some View {
        VStack {
            ProductDetailHeaderView(product: product)
            Spacer()
            ProductDetailQuantityView()
            Spacer()            
            ProductDetailButtonView()
        }
    }
}

#Preview {
    ProductDetailView(product: storesMock[0].products[0])
}
