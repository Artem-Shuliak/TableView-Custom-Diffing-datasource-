//
//  QuoteCell.swift
//  InspoQuotes
//
//  Created by Artem Shuliak  on 3/15/21.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import UIKit

class QuoteCell: UITableViewCell {
        
    @IBOutlet weak var cellBackgoundView: UIView!
    @IBOutlet weak var cellLabel: UILabel!
    
    func configureCell(quote: String) {
        self.cellLabel.text = quote
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellBackgoundView.layer.cornerRadius = contentView.frame.height/5
        cellBackgoundView.layer.borderWidth = 1
        cellBackgoundView.layer.borderColor = UIColor.systemGray5.cgColor
    }    
}
