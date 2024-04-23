//
//  HomeService.swift
//  ChefDelivery
//
//  Created by Pierre Campos Dias on 09/04/24.
//

import Foundation

enum RequestError: Error {
    case invalidURL
    case errorRequest(error: String)
}

struct HomeService {
    func fetchData() async throws -> Result<[StoreType], RequestError> {
        guard let url = URL(string: "https://private-8cea5-chehfdelivery.apiary-mock.com/home") else {
            return .failure(.invalidURL)
        }
        
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let storesObjects = try JSONDecoder().decode([StoreType].self, from: data)
        
        return .success(storesObjects)
    }
    
    func confirmOrder(product: ProductType) async throws -> Result<[String: Any]?, RequestError> {
        guard let url = URL(string: "https://private-8cea5-chehfdelivery.apiary-mock.com/home") else {
            return .failure(.invalidURL)
        }
        
        let encodedObject = try JSONEncoder().encode(product)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = encodedObject
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let message = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        return .success(message)
        
    }
}


//URLSession.shared.dataTask(with: url) { data, _, error in
//    if let error {
//        print(error.localizedDescription)
//    } else if let data {
//        let storesObjects = try? JSONDecoder().decode([StoreType].self, from: data)
//        print(storesObjects)
//    }
//}.resume()
