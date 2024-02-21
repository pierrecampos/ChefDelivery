//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Pierre Campos Dias on 21/02/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    var product: ProductType
    @State private var productQuantity = 1
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 20)
                
                Text(product.name)
                    .font(.title)
                    .bold()
                    .padding(.horizontal)
                    .padding(.top)
                
                Text(product.description)
                    .padding(.horizontal)
                
                Text(product.price.formatToCurrency())
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)
            }
            
            Spacer()
            
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
            
            Spacer()
            
            Button(action: {
                print("Botão Adicionar ao Carrinho")
            }, label: {
                HStack {
                    Image(systemName: "cart")
                    Text("Adicionar ao carrinho")
                }
                .padding(.horizontal, 32)
                .padding(.vertical, 16)
                .font(.title3)
                .bold()
                .background(.colorRed)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 32))
                .shadow(color: .colorRedDark.opacity(0.5), radius: 10, x: 6, y: 8)
            })
        }
    }
}

#Preview {
    ProductDetailView(product: storesMock[0].products[0])
}
