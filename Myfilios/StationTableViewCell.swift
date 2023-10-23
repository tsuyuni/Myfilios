//
//  StationTableViewCell.swift
//  Myfilios
//
//  Created by Yuri Tsuchikawa on 2023/10/24.
//

import UIKit

protocol StationTableViewCellDelegate {
    func onTapAddStoreButton(cell: UITableViewCell)
}

class StationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var stationLabel: UILabel!
    @IBOutlet weak var storeCollectionView: UICollectionView!
    
    var delegate: StationTableViewCellDelegate!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        storeCollectionView.register(UINib(nibName: "StoreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        storeCollectionView.register(UINib(nibName: "AddStoreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "addCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

extension StationTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch (section) {
        case 0: return 10
        case 1: return 1
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch (indexPath.section) {
        case 0:
            let cell = storeCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! StoreCollectionViewCell
            return cell
        case 1:
            let cell = storeCollectionView.dequeueReusableCell(withReuseIdentifier: "addCell", for: indexPath) as! AddStoreCollectionViewCell
            cell.delegate = self
            return cell
        default: return UICollectionViewCell()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
}

extension StationTableViewCell: AddStoreCollectionViewCellDelegate {
    func onTapAddButton(cell: UICollectionViewCell) {
        delegate.onTapAddStoreButton(cell: self)
    }
}
