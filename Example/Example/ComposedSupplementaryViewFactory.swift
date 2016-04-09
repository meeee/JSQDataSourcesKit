//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://jessesquires.com/JSQDataSourcesKit
//
//
//  GitHub
//  https://github.com/jessesquires/JSQDataSourcesKit
//
//
//  License
//  Copyright © 2015 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

import Foundation
import UIKit
import JSQDataSourcesKit

/*
 Example of a composed factory for supplementary views.
 Used for headers and footers in `FetchedCollectionViewController` in the demo
 */

public struct ComposedCollectionSupplementaryViewFactory <Item>: CollectionSupplementaryViewFactoryType {

    public let headerViewFactory: TitledCollectionReusableViewFactory<Item>

    public let footerViewFactory: TitledCollectionReusableViewFactory<Item>

    public init(
        headerViewFactory: TitledCollectionReusableViewFactory<Item>,
        footerViewFactory: TitledCollectionReusableViewFactory<Item>) {
        self.headerViewFactory = headerViewFactory
        self.footerViewFactory = footerViewFactory
    }

    public func supplementaryViewFor(item item: Item?,
                                          kind: SupplementaryViewKind,
                                          collectionView: UICollectionView,
                                          indexPath: NSIndexPath) -> TitledCollectionReusableView {

        switch kind {
        case UICollectionElementKindSectionHeader:
            return headerViewFactory.supplementaryViewFor(item: item,
                                                          kind: kind,
                                                          collectionView: collectionView,
                                                          indexPath: indexPath)

        case UICollectionElementKindSectionFooter:
            return footerViewFactory.supplementaryViewFor(item: item,
                                                          kind: kind,
                                                          collectionView: collectionView,
                                                          indexPath: indexPath)

        default:
            fatalError("attempt to dequeue supplementary view with unknown kind: \(kind)")
        }
    }

    public func configureSupplementaryView(view: TitledCollectionReusableView,
                                           item: Item?,
                                           kind: SupplementaryViewKind,
                                           collectionView: UICollectionView,
                                           indexPath: NSIndexPath) -> TitledCollectionReusableView {

        switch kind {
        case UICollectionElementKindSectionHeader:
            return headerViewFactory.configureSupplementaryView(view,
                                                                item: item,
                                                                kind: kind,
                                                                collectionView: collectionView,
                                                                indexPath: indexPath)
        case UICollectionElementKindSectionFooter:
            return footerViewFactory.configureSupplementaryView(view,
                                                                item: item,
                                                                kind: kind,
                                                                collectionView: collectionView,
                                                                indexPath: indexPath)
        default:
            fatalError("attempt to configure supplementary view with unknown kind: \(kind)")
        }
    }
}
