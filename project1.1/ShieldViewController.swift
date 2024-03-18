//
//  ShieldViewController.swift
//  project1.1
//
//  Created by Md Akash on 18/3/24.
//

import UIKit

class ShieldViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ShowAleart()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ShowAleart()
    }
    
    func ShowAleart(){
        let aleartController = UIAlertController.init(title: "Alart", message: "In shield mode,on data will be shored.It is mone secured more private and anonimous.Do you what to start?", preferredStyle: .alert)
        
        let Goback = UIAlertAction(title: "Go back", style: .default) {action in
            print("Back functionality goes here")
        }
        let proceed = UIAlertAction(title: "Proceed", style: .default) {action in
            print("proceed functionality goes here")
        }
    
        aleartController.addAction(Goback)
        aleartController.addAction(proceed)
      
        DispatchQueue.main.async {
            self.present(aleartController, animated: true)
        }
    }

    
}
