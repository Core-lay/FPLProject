//
//  ViewController.swift
//  PremierLeagueFinally
//
//  Created by mac on 24/4/23.
//

import UIKit

class CollectionViewController: UIViewController {
    
    var players : [welcome] = []
    var firstName: String?
    var secondName: String?
    
    
    private var collectionView : UICollectionView?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchingAPIData(url:  "https://fantasy.premierleague.com/api/bootstrap-static/") { players in
           print(players)
        }
        
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        
      
        guard let collectionView = collectionView else { return }
        
        collectionView.register(PlayerCollectionViewCell.self, forCellWithReuseIdentifier: PlayerCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = view.bounds
        
        view.addSubview(collectionView)
    }
    
    func fetchingAPIData(url: String, completion: @escaping (welcome)-> Void) {
         
         let url = URL(string: url)
         let session = URLSession.shared
         let dataTask = session.dataTask(with: url!) { data, response, error in
             do {
                 let response = try JSONDecoder().decode(welcome.self, from: data!)
                 completion(response)
             } catch {
                 print ("Parsing data error \(error)")
             }
         }
         dataTask.resume()
     }
}


extension CollectionViewController : UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerCollectionViewCell.identifier, for: indexPath) as? PlayerCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.backgroundColor = .systemRed
        return cell
    }
}

