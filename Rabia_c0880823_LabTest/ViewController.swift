//
//  ViewController.swift
//  Rabia_c0880823_LabTest
//
//  Created by Rabia Bembi on 2022-11-04.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startStopBtn: UIButton!
    @IBOutlet weak var stopTimerBtn: UIButton!
    
    @IBOutlet weak var lapBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var resetTimer: UIButton!
    
    
    
    var secondsElapsed = 0
    var timer = Timer()
    var lapTimeArray = [String]()
    
    override func viewDidLoad() {
            super.viewDidLoad()
        self.tableView.delegate = self
           self.tableView.dataSource = self
            //timerLabel.text = "Tap Start."
            // Do any additional setup after loading the view, typically from a nib.
        }
   
    
    
  /*  @IBAction func segMented(_ sender: Any) {
        switch SegmentedControl.selectedSegmentIndex{
        case 0:
            timerLabel.isHidden = false
            startStopBtn.isHidden = false
            stopTimerBtn.isHidden = false
            lapBtn.isHidden = false
            tableView.isHidden = false
            resetTimer.isHidden = false
            datePick.isHidden = true
        case 1:
            timerLabel.isHidden = true
            startStopBtn.isHidden = true
            stopTimerBtn.isHidden = true
            lapBtn.isHidden = true
            tableView.isHidden = true
            resetTimer.isHidden = true
            datePick.isHidden = false
        default:
            break
        }
    }*/
    
       
    
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
        lapBtn.isHidden = false
        resetTimer.isHidden = true
        
    }
    
    @IBAction func LapTimer(_ sender: Any) {
        lapTimeArray.append(timerLabel.text!)
        tableView.reloadData()
        print(lapTimeArray)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //chb
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
