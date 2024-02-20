//
//  StoresItemView.swift
//  ChefDelivery
//
//  Created by Pierre Campos Dias on 17/02/24.
//

import SwiftUI

struct StoresItemView: View {
    
    let order: StoreType
    
    var body: some View {
        HStack {
            Image(order.logoImage)
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
        StoresItemView(order: storesMock[0]).previewLayout(.sizeThatFits)
    }
}
