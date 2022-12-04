//
//  listaPlantas.swift
//  projetoFinal
//
//  Created by Student on 03/10/22.
//  Copyright © 2022 Student. All rights reserved.
//

import Foundation

class PlantasClasse {
    
    let nomeS : String?
    let especieS : String?
    let fotoS : String?
    
    
    init(nomePlantaS: String, especiePlantaS: String, fotoPlantaS: String) {
        
        self.nomeS = nomePlantaS
        self.especieS = especiePlantaS
        self.fotoS = fotoPlantaS
    }
}



class PlantasDAO {
    static func getList () -> [PlantasClasse]{
        return[
            
            PlantasClasse(nomePlantaS: "Xuxu", especiePlantaS: "Manjericão", fotoPlantaS: "planta"),
            PlantasClasse(nomePlantaS: "Mandacas", especiePlantaS: "Cacto", fotoPlantaS: "planta")
        ]
    }
}
