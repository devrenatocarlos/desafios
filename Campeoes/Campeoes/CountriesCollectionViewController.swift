//
//  CountriesCollectionViewController.swift
//  Campeoes
//
//  Created by aluno on 05/07/20.
//  Copyright © 2020 Aluno. All rights reserved.
//

import UIKit

class CountriesCollectionViewController: UIViewController {
    
    var worldCups: [WorldCup] = []
    var items : [String] = []
    var itemSelected :String = ""
    var totalItems = 0
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWorldCups()
        generateTotalItems()
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
    // gerando lista de todas as selecoes que ja participaram de copas do mundo
    func generateTotalItems(){
        // gerando todas as selecoes que já participiram de copas
        for i in 0..<self.worldCups.count{
            for j in 0..<self.worldCups[i].matches.count {
                for k in 0..<self.worldCups[i].matches[j].games.count{
                    items.append(self.worldCups[i].matches[j].games[k].home)
                    items.append(self.worldCups[i].matches[j].games[k].away)
                }
            }
        }
        // retirando elementos repetigos da lista
        items = items.uniqued().sorted()
        totalItems = items.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let teamAchievementsViewController = segue.destination as! TeamAchievementsViewController
        teamAchievementsViewController.country = itemSelected
        teamAchievementsViewController.worldCups = worldCups
        teamAchievementsViewController.totalItems = totalItems
    }
} // fim da classe

extension CountriesCollectionViewController :UICollectionViewDataSource, UICollectionViewDelegate {
    // retorna quantidade total de items da colecao
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    // configura o conteudo da celula do item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CountriesCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.prepare(items: items[indexPath.row])
       
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 8
        return cell
    }
    
    // esse metodo é notificado quando ocorrer cliques (DELEGATE)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        //print("You selected cell #\(indexPath.item)!")
    }
    
    // change background color when user touches cell
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.red
    }

    // change background color back when user releases touch
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.cyan
        itemSelected = items[indexPath.item]
    }
}

//extension para remover duplicidade de elementos
public extension Array where Element: Hashable {
    func uniqued() -> [Element] {
        var seen = Set<Element>()
        return filter{ seen.insert($0).inserted }
    }
}
