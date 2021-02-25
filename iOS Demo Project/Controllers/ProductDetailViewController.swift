//
//  ProductDetailViewController.swift
//  iOS Demo Project
//
//  Created by Ahmer Hassan on 13/02/2021.
//  Copyright © 2021 Ahmer Hassan. All rights reserved.
//

import UIKit
import CLabsImageSlider

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var topNavBar: UIView!
    @IBOutlet weak var imageSliderView: CLabsImageSlider!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var createdDateLabel: UILabel!
    
    
    var imageUrls:[String] = []
    var productData: Results?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupTopNavBar(viewPlaceholder: self.topNavBar)
    }
    
    func setupUI() {
        self.productNameLabel.text = self.productData?.name ?? ""
        self.priceLabel.text = self.productData?.price ?? "-"
        self.createdDateLabel.text = self.productData?.created_at ?? "-"
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        self.imageSliderView.setUpView(imageSource: .Url(imageArray:self.imageUrls,placeHolderImage:#imageLiteral(resourceName: "placeholder")),slideType:.ManualSwipe,isArrowBtnEnabled: true)
    }
    
    
}


