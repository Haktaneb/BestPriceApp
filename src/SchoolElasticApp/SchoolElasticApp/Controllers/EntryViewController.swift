//
//  EntryViewController.swift
//  SchoolElasticApp
//
//  Created by haktan enes biçer on 29.12.2018.
//  Copyright © 2018 haktan enes biçer. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {


    @IBOutlet var StoreName_tf: UITextField!
    @IBOutlet var ItemName_tf: UITextField!
    @IBOutlet var ItemPrice_tf: UITextField!
    @IBOutlet var Address_tf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SaveBtn_TUI(_ sender: Any) {
        let alertController = UIAlertController(title: "Information", message: "Data will be update do you want to Continue?", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Continue", style : UIAlertAction.Style.default, handler:
            {
                UIAlertAction in


                    let elasticModel = ElasticModel()

                elasticModel.storeName = self.StoreName_tf.text!
                elasticModel.itemName = self.ItemName_tf.text!
                elasticModel.itemPrice = Double(self.ItemPrice_tf.text!)!
                    elasticModel.address = self.Address_tf.text!
                ElasticService.SaveProduct(format: elasticModel)
                {
                    if Common.updateSucces == true
                    {
                        self.AlertPopOut(content: "Update is Succesfull!!", sender)
                        print("başarılı")
                    }
                    else
                    {
                        self.AlertPopOut(content: "Update is FAİLED!!",sender)
                        print("başarısız")
                    }
                }

        }
        ))
        alertController.addAction(UIAlertAction(title: "Quit", style : UIAlertAction.Style.default, handler:
            {
                UIAlertAction in

        }
        ))
        present(alertController, animated: true, completion: nil)
    }
    func AlertPopOut(content : String ,_ sender: Any )
    {
        let alertController = UIAlertController(title: "Information", message: content, preferredStyle: UIAlertController.Style.alert)

        alertController.addAction(UIAlertAction(title: "Done", style : UIAlertAction.Style.default, handler:
            nil
        ))
        self.present(alertController, animated: true, completion: { () -> Void in
            //self.performSegue(withIdentifier: "whenComeBackToSaveDetail", sender: sender)
            self.dismiss(animated: true)
        })
    }
    
    @IBAction func BackBtn_TUI(_ sender: Any) {
        dismiss(animated: true)
    }
 

}
