//
//  NavigationBar.swift
//  ChefDelivery
//
//  Created by Pierre Campos Dias on 16/02/24.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack {
            Spacer()
            Button("R. Vergueiro, 3185") {
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.black)
            
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "bell.badge")
                    .font(.title2)
                    .foregroundStyle(.red)
            })
        }
    }
}

#Preview {
    NavigationBar().previewLayout(.sizeThatFits).padding()
}
