//
//  AddStoreCollectionViewCell.swift
//  Myfilios
//
//  Created by Yuri Tsuchikawa on 2023/10/24.
//

import UIKit

protocol AddStoreCollectionViewCellDelegate {
    func onTapAddButton(cell: UICollectionViewCell)
}

class AddStoreCollectionViewCell: UICollectionViewCell {
    
    var delegate: AddStoreCollectionViewCellDelegate!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func addStore() {
        delegate.onTapAddButton(cell: self)
    }
}
