//
//  TeamAchievementsViewController.swift
//  Campeoes
//
//  Created by aluno on 05/07/20.
//  Copyright © 2020 Aluno. All rights reserved.
//

import UIKit

class TeamAchievementsViewController: UIViewController {
    var country: String = ""
    var worldCups: [WorldCup] = []
    var totalItems = 0
    
    @IBOutlet weak var lbCountry: UILabel!
    @IBOutlet weak var lbNumberAchievements: UILabel!
    
    @IBOutlet weak var ivCountry: UIImageView!
    
    @IBOutlet weak var tvAchievements: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ivCountry.image = UIImage(named: country)
        lbCountry.text = country
        generateViewContent()
    }
    
    func generateViewContent(){
        var numberOfAchievements = 0
        var detailOfAchievments = ""
        for _ in 0..<totalItems{
            numberOfAchievements = 0
            detailOfAchievments = ""
            for j in 0..<worldCups.count{
                if country == worldCups[j].winner{
                    numberOfAchievements = numberOfAchievements + 1
                    detailOfAchievments.append("\(worldCups[j].country), \(worldCups[j].year) ( \(worldCups[j].winner) \(worldCups[j].winnerScore) x \(worldCups[j].viceScore) \(worldCups[j].vice) ) \n\n")
                }
            }
        }
        lbNumberAchievements.text = String(numberOfAchievements)
        tvAchievements.text = detailOfAchievments
    }
}
