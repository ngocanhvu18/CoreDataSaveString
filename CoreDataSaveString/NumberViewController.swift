//
//  NumberViewController.swift
//  CoreDataSaveString
//
//  Created by NgocAnh on 5/15/18.
//  Copyright © 2018 NgocAnh. All rights reserved.
//

import UIKit

class NumberViewController: UIViewController {
    
    @IBOutlet weak var numberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
        
        // Do any additional setup after loading the view.
    }
    func displayData() {
        do {
            guard let entity = try AppDelegate.context.fetch(Entity.fetchRequest()) as? [Entity] else {return}
            numberTextField.text = entity.last?.number
        } catch  {
            print("Read Data Error")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveDataToCoreData(_ sender: UIBarButtonItem) {
        let entity = Entity(context: AppDelegate.context)
        entity.name = numberTextField.text
        AppDelegate.saveContext()
    }
    
}
