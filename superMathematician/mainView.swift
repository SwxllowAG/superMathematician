//
//  mainView.swift
//  superMathematician
//
//  Created by Galym Anuarbek on 6/15/17.
//  Copyright © 2017 Galym Anuarbek. All rights reserved.
//

import UIKit



//var life = 4



let defaults = UserDefaults.standard

class mainView: UIViewController {
    
    var c: Int = 0
    var b: Int = 0
    var answer = 0
    var speed = 5
    var timer: Timer?
    var timerr: Timer?
    var Scores: [[String : Any]] = [[:]]
    let standard = UserDefaults.standard
    var a = 0
    var delegate: Communicatable?
    var score = 0
    var totalTime = 15

    
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var lineLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var lifeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func submitButton(_ sender: Any) {
        if Int(answerTextField.text!)==answer{
            score += answer
            scoreLabel.text = "Your score:\(score)"
            newQuestion()
            answerTextField.text = ""
            speed = speed*2
        }else{
            score -= answer
            scoreLabel.text = "Your score:\(score)"
            newQuestion()
            answerTextField.text = ""
            self.speed = self.speed/2
        }
    }
    
    
    
    
   func moveQuestionLabel() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
            if(self.taskLabel.center.y+20 >= self.lineLabel.center.y) {
                self.newQuestion()
//                life -= 1
//                self.lifeLabel.text = "lifes:\(life)"
//                if life <= 0{
//                    self.createAlert(title: "You lose!", message: "Your score is \(score)")
//                }
            }
            UIView.animate(withDuration: 0.2) {
                self.taskLabel.center.y += CGFloat(self.speed)
            }
    }
    }
    
    func newQuestion() {
        c = Int(arc4random_uniform(9) + 1)
        if levell == 1{
            b = Int(arc4random_uniform(9) + 1)
        } else if levell == 2{
            b = Int(arc4random_uniform(9)*10 + 1)
        } else if levell == 3 {
            b = Int(arc4random_uniform(9)*100 + 1)
        }
        
        taskLabel.text = "\(c) x \(b) ="
        answer = c*b
        taskLabel.center.y = 50
    }
    
    func createAlert (title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Nickname"
            textField.textAlignment = .center
            
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            let fNameField = alert.textFields![0] as UITextField
            
            let item = ["name":fNameField.text!,"score":(self.a)] as [String : Any]
            if var a = UserDefaults.standard.value(forKey: "leaders") as? [[String: Any]] {
                a.append(item)
                UserDefaults.standard.set(a, forKey: "leaders")
            }
            else {
                var a = [[String : Any]]()
                a.append(item)
                UserDefaults.standard.set(a, forKey: "leaders")
            }
            
            
            UserDefaults.standard.set (fNameField.text, forKey :"Name")
            UserDefaults.standard.set (String(self.a), forKey :"Score")
            
            
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion:nil)
    }
    
    override func viewDidLoad() {
        score = 0
        totalTime = 15
        speed = 5
        
//        life = 4
        moveQuestionLabel()
        super.viewDidLoad()
        timerr = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.totalTime -= 1
            self.lifeLabel.text = "\(self.totalTime)"
            if self.totalTime <= 0 {
                self.createAlert(title: "You lose!", message: "Your score is \(self.score)")
                self.timerr?.invalidate()
                self.timerr = nil
                self.timer?.invalidate()
                self.timer = nil
            }
        }
        
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
