//
//  FirebaseStorageInteractor.swift
//  macpawCV
//
//  Created by Mykola Medynsky on 4/28/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Cocoa
enum NetworkError: Error {
    case networkError
}
final class NetworkManager{
    private init(){}
    static let shared = NetworkManager.init()
    private let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/cvbeta-e7808.appspot.com/o/profile.json?alt=media&token=2f4bd7b1-4408-4c98-9132-dd94a4cdd974")!
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
    func getImage(url: URL, completion: @escaping(Result<NSImage, Error>)->()) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(NetworkError.networkError))
                }
                return
            }
            let image = NSImage(data: data)
            DispatchQueue.main.async {
                completion(.success(image!))
            }
        }
        task.resume()
    }
    
    
}
