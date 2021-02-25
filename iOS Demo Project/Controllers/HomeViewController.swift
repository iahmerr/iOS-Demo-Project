//
//  HomeViewController.swift
//  iOS Demo Project
//
//  Created by Ahmer Hassan on 11/02/2021.
//  Copyright © 2021 Ahmer Hassan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var topNavBarView: UIView!
    @IBOutlet weak var productTableView: UITableView!
    
    var homeModelView: HomeModelView?
    
    
    var dataArray: [Results] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.homeModelView = HomeModelView()
        self.productTableView.isHidden = true
        self.productTableView.delegate = self
        self.productTableView.dataSource = self
       
            self.showAnimationView()
            self.homeModelView?.getAPIData()
            self.homeModelView?.delegate = self
        
        
       
        self.setupTopNavBar(viewPlaceholder: self.topNavBarView)
        self.productTableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
       
    }
    
    deinit {
        print("Deallocating Reference.")
        self.homeModelView = nil
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.productTableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as? ProductTableViewCell else {
            fatalError("Dequeue Failed")
        }
        
        if self.dataArray.count > 0 {
            cell.initializeUI(productData: self.dataArray[indexPath.row])
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.productTableView.deselectRow(at: indexPath, animated: true)
        self.pushToDetailView(index: indexPath.row)
    }
    
    func pushToDetailView(index: Int) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductDetailViewController") as! ProductDetailViewController
        vc.productData = self.dataArray[index]
        vc.imageUrls = self.dataArray[index].image_urls ?? []
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension HomeViewController: PassProductsData {
    func passAPIData(result: ProductsResponse?) {
        if let ress = result {
            self.dataArray = ress.results!
            DispatchQueue.main.async {
                self.productTableView.isHidden = false
                NotificationCenter.default.post(name: .removeAnimationView, object: nil)
                self.productTableView.reloadData()
            }
        }
    }
}
