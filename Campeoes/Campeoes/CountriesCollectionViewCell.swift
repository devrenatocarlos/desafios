//
//  CountriesCollectionViewCell.swift
//  Campeoes
//
//  Created by aluno on 05/07/20.
//  Copyright © 2020 Aluno. All rights reserved.
//

import UIKit

class CountriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ivCountry: UIImageView!
    
    @IBOutlet weak var lbCountry: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func prepare(items: String) {
        print(items.count)
        ivCountry.image = UIImage(named: items)
        lbCountry.text = "\(items)"
    }
}






