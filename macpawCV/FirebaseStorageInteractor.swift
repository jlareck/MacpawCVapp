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
    private let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/cvbeta-e7808.appspot.com/o/profile.json?alt=media&token=a7f4a0ee-aa6c-4e31-8a3f-2e53cb93d371")!
    private(set) var description: Description?
    //    var description:Description?
    
    func fetch(handler: @escaping (Description?)->()) {
        //  let authString:String = userName + ":" + password
        //  let headerField = ["Authorization": "Basic " + authString.base64Encoded()!]
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        //   request.allHTTPHeaderFields = headerField
        
       
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return print("Error") }
            do {
                let description = try JSONDecoder().decode(Description.self, from: data)
                DispatchQueue.main.async {
                    self.description = description
                    handler(description)
                }
            } catch {
                print("json error: \(error)")
            }
            
        }
        task.resume()
    }
    
}
