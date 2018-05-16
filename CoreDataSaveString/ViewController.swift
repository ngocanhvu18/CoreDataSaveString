//
//  ViewController.swift
//  CoreDataSaveString
//
//  Created by NgocAnh on 5/11/18.
//  Copyright © 2018 NgocAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayData()
    }
    func displayData() {
        do {
            guard let entity = try AppDelegate.context.fetch(Entity.fetchRequest()) as? [Entity] else {return}
            inputTextField.text = entity.last?.name
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
        entity.name = inputTextField.text
        AppDelegate.saveContext()
    }
}

