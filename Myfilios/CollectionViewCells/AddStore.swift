//
//  AddStoreCollectionViewCell.swift
//  Myfilios
//
//  Created by Yuri Tsuchikawa on 2023/10/24.
//

import UIKit

class AddStoreCollectionViewCell: UICollectionViewCell {
    
    var delegate: AddStoreCollectionViewCellDelegate!
    var station: Station!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func addStore() {
        delegate.onTapAddButton(cell: self, station: station)
    }
}

protocol AddStoreCollectionViewCellDelegate {
    func onTapAddButton(cell: UICollectionViewCell, station: Station)
}
