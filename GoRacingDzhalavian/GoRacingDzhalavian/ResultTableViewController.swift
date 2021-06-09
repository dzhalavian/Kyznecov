//
//  ResultTableViewController.swift
//  GoRacingDzhalavian
//
//  Created by user on 09.06.2021.
//

import UIKit

struct resultData    {
    var playerName: String
    var resultGame: String
    var timeGame: String
}

var results: [resultData] = []

class ResultTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        results.append(resultData(playerName: "test", resultGame: "test", timeGame: "test"))
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return results.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt IndexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "row", for: IndexPath) as! ResultTableViewCell
        cell.namePlayer.text = results[IndexPath.row].playerName
        cell.gameResult.text = results[IndexPath.row].resultGame
        cell.timeResult.text = results[IndexPath.row].timeGame
        
        return cell
    }
}
