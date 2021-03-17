//
//  Data.swift
//  PersonSearch
//
//  Created by Ngân Trần on 3/16/21.
//

import Foundation

class FetchApi: ObservableObject {
  @Published var users = [User]()
     
    init() {
       fetchData()
    }
    
    func fetchData(){
        guard let url = URL(string: "https://reqres.in/api/users?page=2") else {return}
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data, error == nil else {return}
            do{
                let model = try JSONDecoder().decode(DataModel.self, from:data)
                self.users = model.data
                print(self.users)
            }
            catch{
                print("failed")
            }
        }
        task.resume()
    }
}

struct User: Codable{
    var id: Int
    var email: String
    var first_name: String
    var last_name: String
    var avatar: String
}
struct DataModel: Codable{
    let data: [User]
}
