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
        Text(store.name)
    }
}

#Preview {
    StoreDetailView(store: storesMock[0])
}
