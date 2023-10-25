//
//  StationTableViewCell.swift
//  Myfilios
//
//  Created by Yuri Tsuchikawa on 2023/10/24.
//

import UIKit

class StationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var stationLabel: UILabel!
    @IBOutlet weak var storeCollectionView: UICollectionView!
    
    var station: Station!
    var stores: [Store] = []
    
    var delegate: StationTableViewCellDelegate!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        storeCollectionView.register(UINib(nibName: "Store", bundle: nil), forCellWithReuseIdentifier: "cell")
        storeCollectionView.register(UINib(nibName: "AddStore", bundle: nil), forCellWithReuseIdentifier: "addCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

protocol StationTableViewCellDelegate {
    func onTapAddStoreButton(cell: UITableViewCell, station: Station)
}

extension StationTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch (section) {
        case 0: return stores.count
        case 1: return 1
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch (indexPath.section) {
        case 0:
            let cell = storeCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! StoreCollectionViewCell
            cell.nameLabel.text = stores[indexPath.row].name
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            return cell
        case 1:
            let cell = storeCollectionView.dequeueReusableCell(withReuseIdentifier: "addCell", for: indexPath) as! AddStoreCollectionViewCell
            cell.station = station
            cell.delegate = self
            return cell
        default: return UICollectionViewCell()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.bounds.width / 3, height:collectionView.bounds.height)
    }
}

extension StationTableViewCell: AddStoreCollectionViewCellDelegate {
    func onTapAddButton(cell: UICollectionViewCell, station: Station) {
        delegate.onTapAddStoreButton(cell: self, station: station)
    }
}
