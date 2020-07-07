//
//  WinnersTableViewController.swift
//  Campeoes
//
//  Created by aluno on 17/06/20.
//  Copyright © 2020 Aluno. All rights reserved.
//

import UIKit

class WinnersTableViewController: UITableViewController {
    
   
    var worldCups: [WorldCup] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWorldCups()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadWorldCups() {
           let fileURL = Bundle.main.url(forResource: "winners", withExtension: ".json")!
           let jsonData = try! Data(contentsOf: fileURL)
            
           do {
               worldCups = try JSONDecoder().decode([WorldCup].self, from: jsonData)
           } catch  {
               print(error)
           }
    }
    

    // MARK: - Table view data source

  
    // data source para alimentar os dados da tabela
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return worldCups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WorldCupTableViewCell
        
        

        let worldCup = worldCups[indexPath.row]
                
        // Configure the cell...
        cell.prepare(with: worldCup)
        
        return cell
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let vc = segue.destination as! WorldCupViewController
        let worldCup = worldCups[tableView.indexPathForSelectedRow!.row]
        vc.worldCup = worldCup
    }
    

} // fim da classe


