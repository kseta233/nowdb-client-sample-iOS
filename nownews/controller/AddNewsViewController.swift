//
//  AddNewsViewController.swift
//  nownews
//
//  Created by Kusuma Seta on 9/4/16.
//  Copyright © 2016 ework. All rights reserved.
//

import UIKit

class AddNewsViewController: UIViewController, BaseApp {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var newsTextArea: UITextField!
    @IBOutlet weak var chooseCatgory: UIButton!
    @IBOutlet weak var uploadImgBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func saveBtnAction(sender: AnyObject) {
        
    }
}
