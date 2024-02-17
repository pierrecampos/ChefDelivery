//
//  StoresItemView.swift
//  ChefDelivery
//
//  Created by Pierre Campos Dias on 17/02/24.
//

import SwiftUI

struct StoresItemView: View {
    
    let order: OrderType
    
    var body: some View {
        HStack {
            Image(order.image)
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(width: 50, height: 50)
            
            Text(order.name)
                .font(.subheadline)
            
            Spacer()
        }
    }
}

struct StoresItemView_Previews: PreviewProvider {
    static var previews: some View {
        StoresItemView(order: OrderType(id: UUID(), name: "Monstro Burguer", image: "monstro-burger-logo")).previewLayout(.sizeThatFits)
    }
}
