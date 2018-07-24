//
//  TableViewController.swift
//  Restaurant of Fate
//
//  Created by Christopher Gerencser and Jared Schwartz on 12/13/17.
//  Copyright © 2017 Jared Schwartz. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(restaurantIndexWithinRadius.count)
        return(restaurantIndexWithinRadius.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        row.textLabel?.text = rating[restaurantIndexWithinRadius[indexPath.row]] + ": " + restaurantNames[restaurantIndexWithinRadius[indexPath.row]]
        return(row)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
