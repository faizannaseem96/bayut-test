//
//  DetailViewController.swift
//  bayut-test
//
//  Created by Faizan  Naseem on 08/02/2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var productViewModel: ProductViewModel?
    
    @IBOutlet weak var productImageView: LazyImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        guard let product = self.productViewModel else { return }
        self.title = "Detail"
        self.productName.text = product.name
        self.productPrice.text = product.price
        
        if let imageUrl = URL(string: product.imageUrl) {
            self.productImageView.loadImage(fromURL: imageUrl, placeHolderImage: "placeholder")
        }
    }
}
