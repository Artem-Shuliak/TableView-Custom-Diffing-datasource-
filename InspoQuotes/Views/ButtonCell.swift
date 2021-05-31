//
//  ButtonCell.swift
//  InspoQuotes
//
//  Created by Artem Shuliak  on 3/16/21.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import UIKit

protocol ButtonCellActions {
    func buttonCellClicked()
}

class ButtonCell: UITableViewCell {
    
    @IBOutlet weak var cellButton: UIButton!
    
    var delegate: ButtonCellActions?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellButton.layer.cornerRadius = cellButton.frame.size.height / 4
    }
    
    func configureElements(buttonTitle: String) {
        cellButton.setTitle(buttonTitle, for: .normal)
    }
    
    func interactionEnabled(isPurchased: Bool) {
        if isPurchased == true {
            cellButton.backgroundColor = .lightGray
            cellButton.alpha = 0.5
            cellButton.isUserInteractionEnabled = false
        } else {
            cellButton.backgroundColor = .systemGreen
            cellButton.alpha = 1
            cellButton.isUserInteractionEnabled = true
        }
    }

    @IBAction func cellButtonAction(_ sender: UIButton) {
        if sender.isHighlighted {
            sender.alpha = 0.5
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                sender.alpha = 1
            }
        }
        delegate?.buttonCellClicked()
    }
}
