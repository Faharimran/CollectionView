//
//  CustomCelll.swift
//  NewcollectionView
//
//  Created by College on 29/05/24.
//

import UIKit

class CustomCelll: UICollectionViewCell {
    @IBOutlet weak var itemLabel : UILabel!
    @IBOutlet weak var selectLabel : UILabel!
    
    var isEditing: Bool = false {
        didSet{
            selectLabel.isHidden = !isEditing
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectLabel.layer.cornerRadius = 15
        self.selectLabel.layer.masksToBounds = true
        self.selectLabel.layer.borderColor = UIColor.white.cgColor
        self.selectLabel.layer.borderWidth = 1.0
        self.selectLabel.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
    }
}
