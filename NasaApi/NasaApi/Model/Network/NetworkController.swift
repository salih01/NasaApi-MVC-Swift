//
//  NetworkController.swift
//  NasaApi
//
//  Created by ALFA on 21.10.2022.
//

import UIKit


class NetworkController {
    
    
    func photoInfo(completion:@escaping (PhotoInfo?) -> Void) {
        
        let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")
        var query: [String:String] = [
            "api_key":"DEMO_KEY",
            "date":"1999-05-19"
        ]
        
        let queryURL = baseURL?.withQueries(query)!
        
        let dataTask = URLSession.shared.dataTask(with: queryURL!) { data, response, error in
            
        let jsonDecoder = JSONDecoder()
            
        if let data = data, let photoInfoObject = try? jsonDecoder.decode(PhotoInfo.self, from: data)  {
                completion(photoInfoObject)
                
            }
        }
        
        dataTask.resume()
        
    }
    
    
    
    func fetchPhotoNow(from url:URL, completion: @escaping (UIImage?) -> Void){
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data,let image = UIImage(data: data) {
                
                completion(image)
            }
            else
            {
                completion(nil)
            }
            
        }
    
        dataTask.resume()
    }
    
    

    
    
    
    
    
    
    
    
}
