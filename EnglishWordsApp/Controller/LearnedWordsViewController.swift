//
//  ViewController.swift
//  EnglishWordsApp
//
//  Created by Owner on 2020/11/29.
//

import UIKit
import VerticalCardSwiper
import DTGradientButton


class LearnedWordsViewController:UIViewController, VerticalCardSwiperDelegate, VerticalCardSwiperDatasource{
    
    @IBOutlet weak var cardSwiper:VerticalCardSwiper!
    
    var english = ["1"]
    var japanese = ["2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardSwiper.delegate = self
        cardSwiper.datasource = self
        cardSwiper.register(nib:UINib(nibName: "CardViewCell", bundle: nil), forCellWithReuseIdentifier: "CardViewCell")
        cardSwiper.reloadData()
        
        
    }
    
    
    
    
    func numberOfCards(verticalCardSwiperView: VerticalCardSwiperView) -> Int {
        //self.list.count
    }

    
    func cardForItemAt(verticalCardSwiperView: VerticalCardSwiperView, cardForItemAt index: Int) -> CardCell {
        if let listVC = verticalCardSwiperView.dequeueReusableCell(withReuseIdentifier: "CardViewCell", for: index) as? CardViewCell {
            
            verticalCardSwiperView.backgroundColor = UIColor.randomFlat()
            view.backgroundColor = verticalCardSwiperView.backgroundColor
            
            let engs = english[index]
            let japs = japanese[index]
            CardCell.setRandomBackgroundColor()
        }
        
    }
    
    //indexNumberを使った単語表示のメソッドを追加
    func showWords(){
        
        let words = ["apple", "orange"]
        
        for (index, word) in words.enumerated() {
            print(index, word)
        }
    }
    
    
    
    
    
}

