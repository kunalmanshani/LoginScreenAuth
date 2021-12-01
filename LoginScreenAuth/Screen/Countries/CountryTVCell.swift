//
//  MyTableViewCellDemo.swift
//  LoginScreenAuth
//
//  Created by Gaditek on 23/11/2021.
//

import UIKit

protocol CountryTVCellDelegate: AnyObject {
    func showButtonDidTap(item: Countries)
}

class CountryTVCell: UITableViewCell {

    @IBOutlet private weak var countryName: UILabel!
    @IBOutlet private weak var countryImage: UIImageView!
    @IBOutlet private weak var countryIdButton: UIButton!
    @IBOutlet private weak var dataCenters: UILabel!
    
    weak var delegate: CountryTVCellDelegate?
    var item: Countries!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func populate(item: Countries) {
        self.item = item
        countryName.text = item.name
        dataCenters.text = "Data Centers: \(item.data_centers.count)"
    }
    
    func willDisplay(item: Countries) {
        self.item = item
        LoadImage.shared.loadImage(code: item.iso_code) { image in
            self.countryImage.image = image
        }
    }
    
    @IBAction private func showButtonAction(_ sender: UIButton) {
        delegate?.showButtonDidTap(item: self.item)
    }
    
}
