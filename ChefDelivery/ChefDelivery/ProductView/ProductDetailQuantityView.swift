//
//  ProductDetailQuantityView.swift
//  ChefDelivery
//
//  Created by Pierre Campos Dias on 27/02/24.
//

import SwiftUI

struct ProductDetailQuantityView: View {
    
    @State private var productQuantity = 1
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Quantidade")
                .font(.title3)
                .bold()
            
            HStack {
                Button(action: {
                    if productQuantity > 1 {
                        productQuantity -= 1
                    }
                }, label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.title2)
                        .bold()
                })
                
                Text("\(productQuantity)")
                    .font(.title2)
                    .bold()
                
                Button(action: {
                    productQuantity += 1
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .bold()
                })
            }
        }
    }
}

#Preview {
    ProductDetailQuantityView()
}
