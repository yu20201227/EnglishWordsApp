//
//  CardViewCell.swift
//  EnglishWordsApp
//
//  Created by Owner on 2020/12/16.
//

import UIKit
import ChameleonFramework
import VerticalCardSwiper

class CardViewCell: CardCell {
    
    @IBOutlet weak var englishWordLabel:UILabel!
    @IBOutlet weak var japaneseWordLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
            }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func setRandomBackgroundColor(){
        let randomRed: CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let randomGreen: CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let randomBlue: CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        self.backgroundColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
    override func layoutSubviews() {
        self.layer.cornerRadius = 12
        super.layoutSubviews()
    }

}

