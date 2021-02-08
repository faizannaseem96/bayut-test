//
//  ProductCell.swift
//  bayut-test
//
//  Created by Faizan  Naseem on 08/02/2021.
//

import UIKit

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var productImage: LazyImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDate: UILabel!
    
    var productViewModel: ProductViewModel? {
        didSet {
            if let name = productViewModel?.name, let price = productViewModel?.price, let thumbnail = productViewModel?.imageThumnail, let date = productViewModel?.createdAt {
                self.productName.text = name
                self.productPrice.text = price
                self.productDate.text = date
                
                // Note: i tried to achieve caching with NSCache. For production apps i use third party libraries for image cache bcause NSCache has some limitation
                if let imageUrl = URL(string: thumbnail) {
                    self.productImage.loadImage(fromURL: imageUrl, placeHolderImage: "placeholder")
                }
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        self.productImage.image = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
