//
//  ViewController.swift
//  bayut-test
//
//  Created by Faizan  Naseem on 08/02/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var productViewModels = [ProductViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchProducts()
        
        setupCells()
    }
    
    func fetchProducts() {
        self.title = "Loading...."
        APIClient.fetchProducts { (response, error) in
            // update view model
            guard let response = response else { return }
            self.productViewModels = response.data.map({ ProductViewModel(product: $0) })
            self.title = "Home"
            
            // refresh tableview
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    func setupCells() {
        self.tableView.register(ProductCell.nib, forCellReuseIdentifier: ProductCell.identifier)
    }
    
    func goToProductDetail(product: ProductViewModel) {
        let vc = DetailViewController.instantiate(fromAppStoryboard: .Main)
        vc.productViewModel = product
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK:- UITableviewDatasource & UITableviewDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier) as? ProductCell else { return UITableViewCell() }
        cell.productViewModel = self.productViewModels[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.goToProductDetail(product: self.productViewModels[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
