//
//  ViewController.swift
//  SchoolElasticApp
//
//  Created by haktan enes biçer on 6.12.2018.
//  Copyright © 2018 haktan enes biçer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource ,UITextFieldDelegate {

    

    @IBOutlet var Search_TF: UITextField!
    @IBOutlet var Product_tv: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return Common.Products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        let productItem = Common.Products[indexPath.row]
        cell.MarketName_lbl.text = productItem.storeName
        cell.ItemName_lbl.text = productItem.itemName
        cell.ItemPrize_lbl.text = String(format: "%1f", productItem.itemPrice )
        cell.LastUpDate_lbl.text = productItem.date
        cell.Address_lbl.text = productItem.address
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == Product_tv {
            return 225
        }
        return 1
    }
    @IBAction func EditingChangedSearchFieldAction(_ sender: Any) {
        let format = SearchRequestModel()
        format.searchTerm = Search_TF.text!
        format.pageNumber = 1
        format.pageSize = 10
        ElasticService.PostAlomofire(format: format)
        {
            self.Product_tv.reloadData()
        }
    }
    //*********keyborard keyboard closing codes start *******
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return(true )
    }
    //*********keyborard keyboard closing codes fnish *******


}

