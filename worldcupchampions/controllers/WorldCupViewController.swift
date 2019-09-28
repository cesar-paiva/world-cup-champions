//
//  WorldCupViewController.swift
//  World Cup Champions
//
//  Created by Cesar Paiva on 28/07/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import UIKit

class WorldCupViewController: UIViewController {

    
    @IBOutlet weak var imageViewWinner: UIImageView!
    @IBOutlet weak var imageViewVice: UIImageView!
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var labelWinner: UILabel!
    @IBOutlet weak var labelVice: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var worldCup: WorldCup?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let worldCup = worldCup {
            title = "WorldCup \(worldCup.year)"
            imageViewWinner.image = UIImage(named: worldCup.winner)
            imageViewVice.image = UIImage(named: worldCup.vice)
            labelScore.text = "\(worldCup.winnerScore) x \(worldCup.viceScore)"
            labelWinner.text = worldCup.winner
            labelVice.text = worldCup.vice
        }
    }

}

extension WorldCupViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return worldCup?.matches.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let games = worldCup?.matches[section].games
        return games?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? GamesTableViewCell else { return UITableViewCell() }
        if let worldCup = worldCup {
            let match = worldCup.matches[indexPath.section]
            let game = match.games[indexPath.row]
            cell.prepare(with: game)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let match = worldCup?.matches[section]
        return match?.stage
    }
}

extension WorldCupViewController : UITableViewDelegate {}
