//
//  GamesTableViewCell.swift
//  World Cup Champions
//
//  Created by Cesar Paiva on 01/08/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import UIKit

class GamesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewHome: UIImageView!
    @IBOutlet weak var imageViewAway: UIImageView!
    @IBOutlet weak var labelHome: UILabel!
    @IBOutlet weak var labelAway: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func prepare(with game: Game) {
        imageViewHome.image = UIImage(named: "\(game.home).png")
        imageViewAway.image = UIImage(named: "\(game.away).png")
        labelHome.text = game.home
        labelAway.text = game.away
        labelScore.text = game.score
    }

}
