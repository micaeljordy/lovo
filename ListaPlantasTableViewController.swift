//
//  ListaPlantasTableViewController.swift
//  projetoFinal
//
//  Created by Student on 03/10/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class ListaPlantasTableViewController: UITableViewController {
    
    var plantasTVC = [PlantasClasse]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        plantasTVC = PlantasDAO.getList()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plantasTVC.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "plantaCell", for: indexPath)

        if let plantasCell = cell as? PlantaTableViewCell {
            
            let plantaTVC = plantasTVC[indexPath.row]
            plantasCell.EspeciePlantaLabel.text = plantaTVC.especieS
            plantasCell.NomePlantaLabel.text = plantaTVC.nomeS
            plantasCell.FotoPlantaImageView.image = UIImage(named: "planta")
            
            return plantasCell
        }
        
        
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueStatus"{
            
            if let novaview = segue.destination as? ProgressViewController2 {
                let num = tableView.indexPathForSelectedRow?.row
                let cell = plantasTVC[num!]
                
                novaview.nomeVC = cell.nomeS
                novaview.especieVC = cell.especieS
                novaview.fotoVC = cell.fotoS
            }
        }
    }
}
