//
//  ProductDetailButtonView.swift
//  ChefDelivery
//
//  Created by Pierre Campos Dias on 27/02/24.
//

import SwiftUI

struct ProductDetailButtonView: View {
    
    var onButtonPressed: () -> Void
    
    var body: some View {
        Button(action: {
            onButtonPressed()
        }, label: {
            HStack {
                Image(systemName: "cart")
                Text("Enviar pedido")
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
#Preview {
    ProductDetailButtonView(onButtonPressed: {})
}
