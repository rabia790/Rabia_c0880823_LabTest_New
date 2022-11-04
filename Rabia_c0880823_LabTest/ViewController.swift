//
//  ViewController.swift
//  Rabia_c0880823_LabTest
//
//  Created by Rabia Bembi on 2022-11-04.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startStopBtn: UIButton!
    @IBOutlet weak var stopTimerBtn: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var resetTimer: UIButton!
    
    var secondsElapsed = 0
    var timer = Timer()
    var lapTimeArray = [String]()
    override func viewDidLoad() {
            super.viewDidLoad()
            //timerLabel.text = "Tap Start."
            // Do any additional setup after loading the view, typically from a nib.
        }
    @IBAction func startBtn(_ sender: Any) {
    
    
    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
        self.secondsElapsed += 1
        let finalTime = self.secondsToHoursMinutesSeconds(Int(self.secondsElapsed))
        self.timerLabel.text = finalTime
        
    }
        
        stopTimerBtn.isHidden = false
        resetTimer.isHidden = true
        
    }
    
    @IBAction func stopTimerAction(_ sender: Any) {
        timer.invalidate()
        stopTimerBtn.isHidden = true
        resetTimer.isHidden = false
        
        
    }
    
    @IBAction func resetTimer(_ sender: Any) {
      print("reset")
    }
    
    @IBAction func LapTimer(_ sender: Any) {
        lapTimeArray.append(timerLabel.text!)
        tableView.reloadData()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return lapTimeArray.count
       
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lapRecordCell")
        cell?.textLabel?.text = lapTimeArray[indexPath.row]
        return cell!
        
    }
  
   

    
    private func secondsToHoursMinutesSeconds(_ seconds: Int) -> (String) {
        let calHours = seconds / 3600
        let calMinutes = (seconds % 3600) / 60
        let calSeconds = (seconds % 3600) % 60
        let finalTime = "\(calHours) : \(calMinutes): \(calSeconds)"
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "HH:mm:ss"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "HH:mm:ss"
        
        let date = dateFormatterGet.date(from: finalTime)!
        
        return dateFormatterPrint.string(from: date)
    }
    
    
    
}
