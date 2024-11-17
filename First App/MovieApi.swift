

import Foundation

// Writing the function for api call - Hard Challenge

class API {
    func decode( completion: @escaping ([Movie]) -> ()){
//        Creating the URL
        let api_url = URL(string: "https://cdn.filestackcontent.com/OFI199CwQtC87z7Mp2ep")
        
//        URL session & api call
        URLSession.shared.dataTask(with: api_url!) {( data, _, error ) in
            //            Check for errors
            guard let data = data, error == nil else {
                print("error")
                return
            }
            //            Parse response to json object
            
            let loadedData = try! JSONDecoder().decode([Movie].self, from: data )
            
            DispatchQueue.main.async {
                completion(loadedData)
            }
            
            }
            .resume()
        }
    }
