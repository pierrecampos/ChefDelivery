//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Pierre Campos Dias on 15/02/24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Attributes
    private let service = HomeService()
    @State private var storesType: [StoreType] = []
    
    @State private var isLoading = true
    
    // MARK: - View
    var body: some View {
        NavigationStack {
            VStack (spacing: 0) {
                if isLoading {
                    ProgressView()
                } else {
                    NavigationBar()
                        .padding(.horizontal, 15)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                            OrderTypeGridView()
                            CarouselTabView()
                            StoresContainerView(stores: storesType)
                        }
                    }.preferredColorScheme(.light)
                }
            }
        }.onAppear() {
            Task {
                await getStores()
            }
            
        }
    }
    
    // MARK: - Methods
    func getStores() async {
        do {
            let result = try await service.fetchData()
            
            switch result {
            case .success(let stores):
                self.storesType = stores
                self.isLoading = false                
            case .failure(let error):
                self.isLoading = false
                print(error.localizedDescription)
            }
            
        } catch {
            self.isLoading = false
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()
}
