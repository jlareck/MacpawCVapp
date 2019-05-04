//
//  FirebaseStorageInteractor.swift
//  macpawCV
//
//  Created by Mykola Medynsky on 4/28/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Foundation
final class FirebaseStorageInteractor{
    private init(){}
    static let shared = FirebaseStorageInteractor.init()
    private let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/cvbeta-e7808.appspot.com/o/profile.json?alt=media&token=5d96dd19-1cb9-47e3-a371-bf01a094c9cb")!
    private(set) var description: Description?
    
    func fetch(handler: @escaping (Result<Description, Error>)->()) {

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

       
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return print("Error") }
            do {
                let description = try JSONDecoder().decode(Description.self, from: data)
               DispatchQueue.main.async {
                    self.description = description
                    handler(.success(description))
                }
            } catch {
                print("json error: \(error)")
                handler(.failure(error))
            }
            
        }
        task.resume()
    }
    
}
