//
//  QuoteTableViewController.swift
//  InspoQuotes
//
//  Created by Angela Yu on 18/08/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class QuoteTableViewController: DiffableTableViewController {
    
    var quoteModel = QuoteModel()
    let isPurchasedKey = "isPurchased"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        navigationItem.customAppearance()
        addPurchasedContent()
    
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return quoteModel.quotesToShow.count
        } else {
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell", for: indexPath) as! QuoteCell
            let quote = quoteModel.quotesToShow[indexPath.row]
            cell.configureCell(quote: quote)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as! ButtonCell
            cell.delegate = self
            cell.configureElements(buttonTitle: "Get More Quotes")
            cell.interactionEnabled(isPurchased: self.isPurchased)
            return cell
        }
        
    }
    
    @IBAction func restorePressed(_ sender: UIBarButtonItem) {
        UserDefaults.standard.set(false, forKey: isPurchasedKey)
        addPurchasedContent()
    }


}

extension QuoteTableViewController: ButtonCellActions {
    func buttonCellClicked() {
        UserDefaults.standard.set(true, forKey: isPurchasedKey)
        addPurchasedContent()
    }
    
    var isPurchased: Bool {
        let purchaseStatus = UserDefaults.standard.bool(forKey: isPurchasedKey)
        if purchaseStatus {
            return true
        } else {
            return false
        }
    }
    
    func addPurchasedContent() {
    
        if isPurchased {
            quoteModel.quotesToShow.append(contentsOf: quoteModel.premiumQuotes)
            diffRows(newData: quoteModel.quotesToShow)
        } else {
            quoteModel.quotesToShow = quoteModel.freeQuotes
            diffRows(newData: quoteModel.quotesToShow)
        }
    }
    
}
