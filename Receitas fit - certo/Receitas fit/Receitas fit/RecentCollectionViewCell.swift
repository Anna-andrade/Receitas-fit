//
//  RecentCollectionViewCell.swift
//  Receitas fit
//
//  Created by Gabriel Batista Cristiano on 21/10/21.
//

import UIKit

class RecentCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var recentImage: UIImageView!
    @IBOutlet weak var recentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    static func nib() -> UINib{
        return UINib(nibName: "RecentCollectionViewCell", bundle: nil)
    }
}
