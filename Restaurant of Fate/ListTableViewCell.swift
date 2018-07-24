//
//  ListTableViewCell.swift
//  Restaurant of Fate
//
//  Created by Jared Schwartz on 12/13/17.
//  Copyright © 2017 Christopher Gerencser. All rights reserved.
//
//UNUSED FILE
import UIKit

class ListTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(restaurantIndexWithinRadius.count)
        return(restaurantIndexWithinRadius.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        row.textLabel?.text = rating[restaurantIndexWithinRadius[indexPath.row]] + ": " + restaurantNames[restaurantIndexWithinRadius[indexPath.row]]
        return(row)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
