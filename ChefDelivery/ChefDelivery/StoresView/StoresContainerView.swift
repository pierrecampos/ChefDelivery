//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Pierre Campos Dias on 17/02/24.
//

import SwiftUI

struct StoresContainerView: View {
    
    let title = "Lojas"
    @State private var ratingFilter = 0
    @State var stores: [StoreType]
    
    var filteredStores: [StoreType] {
        return stores.filter { store in
            store.stars >= ratingFilter && 1 == 1
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.headline)
                
                Spacer()
                
                Menu("Filtrar") {
                    Button {
                        ratingFilter = 0
                    } label: {
                        Text("Limpar filtro")
                    }
                    
                    Divider()
                    
                    ForEach(1...5, id: \.self) { rating in
                        Button {
                            ratingFilter = rating
                        } label: {
                            if rating > 1 {
                                Text("\(rating) estrelas ou mais")
                            } else {
                                Text("\(rating) estrela ou mais")
                            }
                        }
                    }
                }
                .foregroundStyle(.black)
            }
            
            LazyVStack(alignment: .leading, spacing: 30) {
                if filteredStores.isEmpty {
                    Text("Nenhum resultado encontrado.")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.colorRed)
                        .padding(.vertical, 32)
                        .frame(maxWidth: .infinity)
                } else {
                    ForEach(filteredStores) { store in
                        NavigationLink {
                            StoreDetailView()
                                .environmentObject(store)
                        } label: {
                            StoresItemView(order: store)
                        }
                    }.foregroundStyle(.black)
                }
            }
        }.padding(20)
    }
}

struct StoresContainerView_Previews: PreviewProvider {
    static var previews: some View {
        StoresContainerView(stores: storesMock)
            .previewLayout(.sizeThatFits)
    }
}
