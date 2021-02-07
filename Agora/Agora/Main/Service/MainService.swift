//
//  MainService.swift
//  Agora
//
//  Created by Ivan Myrza on 03.02.2021.
//  Copyright © 2021 Ivan Myrza. All rights reserved.
//

import Foundation

class MainService {
    
    func fetchMainData(urlPath: String, completion: @escaping ([MainStorageElement]) -> ()) {
        
        guard var url = URLComponents(string: "https://jsonplaceholder.typicode.com") else {return}
        url.path = urlPath
        
        URLSession.shared.dataTask(with: url.url!) { (data, response, error) in
            if let data = data {
                do {
                    let json = try JSONDecoder().decode([MainStorageElement].self, from: data)
                    
                    DispatchQueue.main.async {
                        completion(json)
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            } else {
                print(error?.localizedDescription as Any)
            }
        }.resume()
        
    }
}

