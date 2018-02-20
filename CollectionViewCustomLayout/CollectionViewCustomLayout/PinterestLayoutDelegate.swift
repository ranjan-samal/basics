//
//  PinterestLayoutDelegate.swift
//  CollectionViewCustomLayout
//
//  Created by Priyaranjan samal on 2/20/18.
//  Copyright © 2018 Priyaranjan Samal. All rights reserved.
//

import UIKit

protocol PinterestLayoutDelegate: class {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat
}
