//
//  PopUpUIViewController.swift
//  projetoFinal
//
//  Created by Student on 05/10/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class PopUpUIViewController: UIViewController {
    
    @IBAction func showPopUp(_ sender: Any) {
        
        let alert = UIAlertController(title: "confirmacao de cadastro", message: "Cadastro feito com sucesso", preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "Okay", style: .default){
            (action) in
            print(action)
        }
        
        alert.addAction(okayAction)
        
        present(alert, animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard() {
    //Causes the view (or one of its embedded text fields) to resign the first responder status.
    view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
