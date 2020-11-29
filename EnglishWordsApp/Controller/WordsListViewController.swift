//
//  WordsListViewController.swift
//  EnglishWordsApp
//
//  Created by Owner on 2020/11/29.
//

import UIKit

class WordsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var word = String()
    var resultAPIMeaning = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return word.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return  160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .orange
        let words = cell.contentView.viewWithTag(1) as! UILabel
        let results = cell.contentView.viewWithTag(2) as! UILabel
        words.text = self.word
        results.text = self.resultAPIMeaning
        
        return cell
        
    }
    
}
