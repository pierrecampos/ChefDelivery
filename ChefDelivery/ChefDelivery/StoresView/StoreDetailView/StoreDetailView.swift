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
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                StoreDetailHeaderView(store: store)
                StoreDetailProductsView(products: store.products)
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
