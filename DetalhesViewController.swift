//
//  ViewController.swift
//  projetoFinal
//
//  Created by Student on 30/09/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var fotoVC : String?
    var nomeVC : String?
    var especieVC: String?
    
    @IBOutlet weak var FotoPlantaVC: UIImageView!
    
    @IBOutlet weak var NomePlantaVC: UILabel!
    
    @IBOutlet weak var EspeciePlantaVC: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.NomePlantaVC.text = nomeVC!
        self.EspeciePlantaVC.text = especieVC!
        self.FotoPlantaVC.image = UIImage(named: fotoVC!)
        
    }


}
