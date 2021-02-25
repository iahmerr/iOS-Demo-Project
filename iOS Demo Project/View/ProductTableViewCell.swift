//
//  ProductTableViewCell.swift
//  iOS Demo Project
//
//  Created by Ahmer Hassan on 12/02/2021.
//  Copyright © 2021 Ahmer Hassan. All rights reserved.
//

import UIKit
import SDWebImage

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var dataView: UIView!
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        HelpingClass.ApplyShadow(ViewPlaceHolder: self.dataView, shadowRadius: 10)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initializeUI(productData: Results)  {
        self.productImage.sd_setImage(with: URL(string: productData.image_urls_thumbnails?[0] ?? ""), placeholderImage: #imageLiteral(resourceName: "placeholder"))
        self.nameLabel.text = productData.name
        self.priceLabel.text = productData.price
        self.idLabel.text = productData.uid
        
    }
    
}
