//
//  GameViewController.swift
//  GoRacingDzhalavian
//
//  Created by user on 09.06.2021.
//

import UIKit

class GameViewController: UIViewController {

    var gameTimer: Timer!
    var carPcTimer: Timer!
    var stateSemafor: Int = 1
    var gameTime: Timer!
    var timeLeft = 0
    
    @IBOutlet weak var PcCar: UIImageView!
    @IBOutlet weak var userCar: UIImageView!
    @IBOutlet weak var finishLine: UIImageView!
    @IBOutlet weak var semaforLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        userCar.image = UIImage(named: userCarImage)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func StartGameAction(_ sender: UIButton) {
        gameTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(intervalTimer), userInfo: nil, repeats: true)
        carPcTimer = Timer.scheduledTimer(timeInterval: 0.5 , target: self, selector: #selector(pcDriver), userInfo: nil, repeats: true)
        gameTime = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(game), userInfo: nil, repeats: true)
    }
    
    @objc func game() {
        timeLeft += 1
        timerLabel.text = String(timeLeft)
    }
    
    
    
    @IBAction func driverCarAction(_ sender: UIButton) {
        
        if stateSemafor == 2{
            userCar.center.x += 10
        }
        if stateSemafor == 1{
            userCar.center.x -= 10
        }
        if userCar.center.x > finishLine.center.x {
            gameTimer.invalidate()
            carPcTimer.invalidate()
            gameEnd(message: "You winner!")
        }
    }
    
    @objc func intervalTimer(){
        stateSemafor += 1
        
        if stateSemafor > 2 {
            stateSemafor = 1
        }
        switch stateSemafor {
        
        case 1:
            semaforLabel.text = "STOP"
            semaforLabel.textColor = .red
        case 2:
            semaforLabel.text = "Driver"
            semaforLabel.textColor = .green
        default:
            break
            
        }
    }
    
    @objc func pcDriver(){
        if stateSemafor == 2 {
            PcCar.center.x += 10
        }
        if PcCar.center.x > finishLine.center.x {
            gameTimer.invalidate()
            carPcTimer.invalidate()
            gameEnd(message: "You lose")
        }
    }
    
    func gameEnd(message: String) {
        let alert  = UIAlertController(title: "Game End", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        results.append(resultData(playerName: "me", resultGame: message, timeGame: String(timeLeft)))
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
