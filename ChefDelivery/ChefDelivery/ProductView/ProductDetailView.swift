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
    @State private var showAlert = false
    @State private var customMessage = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    private let service =  HomeService()
    
    var body: some View {
        VStack {
            ProductDetailHeaderView(product: product)
            Spacer()
            ProductDetailQuantityView(productQuantity: $productQuantity)
            Spacer()
            ProductDetailButtonView(onButtonPressed: {
                Task {
                    await confirmOrder()
                }
            })
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Chef Delivery"), message: Text(customMessage),
                  dismissButton: .default(Text("OK"), action: {
                presentationMode.wrappedValue.dismiss()
            }))
        }
    }
    
    func confirmOrder() async {
        do {
            let result = try await service.confirmOrder(product: product)
            switch result  {
            case .success(let data):
                customMessage = data?["message"] as? String ?? "Pedido Enviado com Sucesso"
                showAlert = true
            case .failure(let error):
                print(error.localizedDescription)
                showAlert = false
            }
        } catch {
            print(error.localizedDescription)
            showAlert = false
        }
        
    }
}

#Preview {
    ProductDetailView(product: storesMock[0].products[0])
}
