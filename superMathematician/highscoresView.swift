//
//  highscoresView.swift
//  superMathematician
//
//  Created by Galym Anuarbek on 6/15/17.
//  Copyright © 2017 Galym Anuarbek. All rights reserved.
//

import UIKit
import CoreData



class highscoresView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var Scores: [[String : Any]] = [[:]]
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let a = UserDefaults.standard.object(forKey: "leaders") as? [[String: Any]] {
            Scores = a
            self.Scores.sort { (v1, v2) -> Bool in return (v1["score"] as! Int) > (v2["score"] as! Int)}
            myTableView.reloadData()
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        let player = Scores[indexPath.row]
        cell.textLabel?.text = "\(player["name"]) - \(player["score"])"
        
        return (cell)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
