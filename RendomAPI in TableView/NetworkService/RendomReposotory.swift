//
//  RendomReposotory.swift
//  RendomAPI in TableView
//
//  Created by USER on 02/09/2022.
//

import UIKit

class RandomRepository: NSObject {
 
    func getRandomRequest(custId: String, completion: @escaping (_ success: MyModel) -> Void) {
        
        let fullUrl = AllApi.RANDOM_REQUEST + "&results=\(custId)"
        print(fullUrl)
        var request = URLRequest(url: URL(string: fullUrl)!)
        request.httpMethod = "GET"
        request.timeoutInterval = 120 // 120 sec
        
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let myData = data, error == nil else { return }
            do {
                print(myData)
                let responseModel = try JSONDecoder().decode(MyModel.self, from: myData )
                DispatchQueue.main.async {
                    completion(responseModel)
                }
            } catch let err {
                print(err)
            }
        }.resume()
         
    }
}
