//
//  WinnersTableViewController.swift
//  World Cup Champions
//
//  Created by Cesar Paiva on 28/07/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import UIKit

class WinnersTableViewController: UITableViewController {
    
    var worldCups: [WorldCup] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadWorldCups()
    }
    
    func loadWorldCups() {
        let fileURL = Bundle.main.url(forResource: "winners.json", withExtension: nil)
        if let fileURL = fileURL {
            do {
                let jsonData = try Data(contentsOf: fileURL)
                worldCups = try JSONDecoder().decode([WorldCup].self, from: jsonData)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? WorldCupViewController else { return }
        let worldCup = worldCups[tableView.indexPathForSelectedRow!.row]
        viewController.worldCup = worldCup
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return worldCups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WorldCupTableViewCell else { return UITableViewCell() }
        let worldCup = worldCups[indexPath.row]
        cell.prepare(with: worldCup)
        return cell
    }

}
