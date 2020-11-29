//
//  ViewController.swift
//  EnglishWordsApp
//
//  Created by Owner on 2020/11/29.
//

import UIKit
import PKHUD
import Firebase
import FirebaseAuth
import Alamofire
import SwiftyJSON

class LearnedWordsViewController: UIViewController {
    
    @IBOutlet weak var textField:UITextField!
    
    var resultAPIMeaning = String()
    var word  = String()
    var apikey = "MjAyMC8xMS8yOSAwNjoyMzo1NGVkMmM2NDA3LTIzNTMtNDVlOC1iOGM1LWU0MjZkMDNjZTM2MQ=="
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
    }
    
    @IBAction func nextButton(sender:UIButton){
        startParse()
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! WordsListViewController
        nextVC.word = textField.text!
    }
    
    func startParse(){
        
        HUD.show(.progress)
        
        let urlString = "https://apitore.com/store/apis/details?id=20&apikey=\(apikey)&word=\( textField.text)"
        let encoderUrlString:String = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        

        AF.request(encoderUrlString, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { [self] (response) in

            switch response.result {

            case .success:

                let nextVC = WordsListViewController()
                let json:JSON = JSON(response.data as? Any)

                for i in 0 ..<  resultAPIMeaning.count {

                    let userChoseWord = json["results"][i]["word"].string!
                    self.resultAPIMeaning.append(userChoseWord)
                }


             var resultCount:Int = json["resultCount"].int!

                       if 1 < resultCount {
                        resultCount  = 1
            
            let oneWord = textField.text!
             self.word.append(oneWord)
                HUD.hide()
                       }
            case .failure(let error):
                print(error)
            }
            
                }
            
        }
    }
