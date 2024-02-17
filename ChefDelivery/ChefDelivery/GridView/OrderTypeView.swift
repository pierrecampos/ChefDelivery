//
//  OrderTypeView.swift
//  ChefDelivery
//
//  Created by Pierre Campos Dias on 16/02/24.
//

import SwiftUI

struct OrderTypeView: View {
    
    let orderType: OrderType
    
    var body: some View {
        VStack(spacing: 5) {
            Image(orderType.image)
                .resizable()
                .scaledToFit()
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            
            Text(orderType.name)
                .font(.system(size: 10))                
        }.frame(width: 70, height: 100)
    }
}

struct OrderTypeView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTypeView(orderType: orderMocks[0]).previewLayout(.sizeThatFits)
    }
}
