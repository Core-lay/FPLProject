//
//  APICall.swift
//  PremierLeagueFinally
//
//  Created by mac on 24/4/23.
//
import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    static let baseURL = "https://fantasy.premierleague.com/api/bootstrap-static/"
    let cache = NSCache <NSString, UIImage>()
    
    private init() {}
    
    func getPlayers(for firstName: String, secondName: String, completion: @escaping (Result <[welcome], Errors>) -> Void) {
        
        let endpoint = "https://fantasy.premierleague.com/api/bootstrap-static/"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.networkCallError))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completion(.failure(.networkCallError))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidPlayer))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy =  .convertFromSnakeCase
                let players =  try decoder.decode([welcome].self, from: data)
                completion(.success(players))
            }
            catch {
                completion(.failure(.invalidPlayer))
            }
        }
        task.resume()
        
    }
}







//class PlayerVC : UIViewController {
//
//    override func viewDidLoad(){
//        super.viewDidLoad()
//
//        fetchingAPIData(url: "https://fantasy.premierleague.com/api/bootstrap-static/") { result in
//            print(result)
//        }
//
//    }
//
//   public func fetchingAPIData(url: String, completion: @escaping (welcome)-> Void) {
//
//        let url = URL(string: url)
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: url!) { data, response, error in
//            do {
//                let response = try JSONDecoder().decode(welcome.self, from: data!)
//                completion(response.self)
//            } catch {
//                print ("Parsing data error \(error)")
//            }
//        }
//        dataTask.resume()
//    }
//}
