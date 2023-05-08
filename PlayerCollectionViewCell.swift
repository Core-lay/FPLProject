//
//  PlayerCollectionViewCell.swift
//  PremierLeagueFinally
//
//  Created by mac on 24/4/23.
//

import UIKit

class PlayerCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PlayerCell"
    
    
    private let playerImage: UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage(systemName: "house")
        image.tintColor = .label
        image.backgroundColor = .orange
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    private let playerLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Player name"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.tintColor = .label
        label.textAlignment = .center
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(playerLabel)
        contentView.addSubview(playerImage)
        contentView.clipsToBounds = true
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    
    private func configure() {
        addSubview(playerImage)
        addSubview(playerLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            playerImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            playerImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            playerImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            playerImage.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            
            playerLabel.topAnchor.constraint(equalTo: playerImage.bottomAnchor, constant: 12),
            playerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            playerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            playerLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
