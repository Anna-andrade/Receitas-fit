//
//  CategoryCollectionViewCell.swift
//  Receitas fit
//
//  Created by Gabriel Batista Cristiano on 21/10/21.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
    }
}
