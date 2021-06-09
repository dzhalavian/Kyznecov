//
//  ViewController.swift
//  GoRacingDzhalavian
//
//  Created by user on 09.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var playerName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func CloseAppAction(_ sender: Any) {
        exit(0)
    }
    
    @IBAction func SettingAction(_ sender: Any) {
        let alert = UIAlertController(title: "Settings name", message: "Enter player nickname. \n Nickname is now: \(playerName)", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Player name"
        }
        let cancelAction = UIAlertAction(title: "Close", style: .cancel, handler: nil)
        let addAction = UIAlertAction(title: "Confirm", style: .default) { (action) in
            self.playerName = alert.textFields![0].text
        }
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        
        self .present(alert, animated: true, completion: nil)
    }
}

