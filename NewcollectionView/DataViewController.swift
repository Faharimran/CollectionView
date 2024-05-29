//
//  DataViewController.swift
//  NewcollectionView
//
//  Created by College on 28/05/24.
//

import UIKit

class DataViewController: UIViewController {

    var selectedData: String?
        
    @IBOutlet weak var dataLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataLable.text = selectedData
        // Do any additional setup after loading the view.
    }
    


}
