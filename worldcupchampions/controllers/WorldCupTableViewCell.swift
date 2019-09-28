//
//  WorldCupTableViewCell.swift
//  World Cup Champions
//
//  Created by Cesar Paiva on 29/07/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import UIKit

class WorldCupTableViewCell: UITableViewCell {

    @IBOutlet weak var labelYear: UILabel!
    @IBOutlet weak var imageViewWinner: UIImageView!
    @IBOutlet weak var imageViewVice: UIImageView!
    @IBOutlet weak var labelWinner: UILabel!
    @IBOutlet weak var labelVice: UILabel!
    @IBOutlet weak var labelWinnerScore: UILabel!
    @IBOutlet weak var labelViceScore: UILabel!
    @IBOutlet weak var labelCountry: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func prepare(with cup: WorldCup) {
        labelYear.text = "\(cup.year)"
        imageViewWinner.image = UIImage(named: cup.winner)
        imageViewVice.image = UIImage(named: cup.vice)
        labelWinner.text = cup.winner
        labelVice.text = cup.vice
        labelWinnerScore.text = cup.winnerScore
        labelViceScore.text = cup.viceScore
        labelCountry.text = cup.country
    }

}
