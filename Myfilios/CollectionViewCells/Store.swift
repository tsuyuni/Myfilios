//
//  StoreCollectionViewCell.swift
//  Myfilios
//
//  Created by Yuri Tsuchikawa on 2023/10/24.
//

import UIKit

class StoreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

@IBDesignable class StoreImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}
