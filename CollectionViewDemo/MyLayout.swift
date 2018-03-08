import AVKit
import Foundation

class MyLayout : UICollectionViewLayout {
    
    private var vms : [MyImageViewModel] = []
    private var itemAttributes : [UICollectionViewLayoutAttributes] = []
    private var BUFFER : CGFloat = 10
    
    func initialize(_ vms:[MyImageViewModel]) {
        self.vms = vms
    }
    
    override public func prepare() {
        
        if self.collectionView?.numberOfSections == 0 {
            return
        }
        
        if itemAttributes.count > 0 {
            return
        }
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        let smallImageSize = (screenWidth - (4 * BUFFER)) / 3
        let largeImageSize = smallImageSize + BUFFER + smallImageSize
        
        var xOffset : CGFloat = BUFFER
        var yOffset : CGFloat = BUFFER
        
        for section in 0..<collectionView!.numberOfSections {
            
            for index in 0..<vms.count {
                
                let indexPath = IndexPath(item: index, section: section)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                
                if index == 0 {
                    
                    attributes.frame = CGRect(x: xOffset, y: yOffset, width: largeImageSize, height: largeImageSize).integral
                    itemAttributes.append(attributes)
                    xOffset += largeImageSize + BUFFER
                }
                else if index == 1 {
                    
                    attributes.frame = CGRect(x: xOffset, y: yOffset, width: smallImageSize, height: smallImageSize).integral
                    itemAttributes.append(attributes)
                    yOffset += smallImageSize + BUFFER
                }
                else if index == 2 {
                    
                    attributes.frame = CGRect(x: xOffset, y: yOffset, width: smallImageSize, height: smallImageSize).integral
                    itemAttributes.append(attributes)
                    xOffset = BUFFER
                }
                else {
                    
                    let remainder = index % 3
                    if remainder == 0 {
                        xOffset = BUFFER
                        yOffset += smallImageSize + BUFFER
                    }
                    
                    attributes.frame = CGRect(x: xOffset, y: yOffset, width: smallImageSize, height: smallImageSize).integral
                    itemAttributes.append(attributes)
                    xOffset += smallImageSize + BUFFER
                }
            }
        }
    }
    
    override public var collectionViewContentSize: CGSize {
        return CGSize(width: collectionView!.frame.width, height: collectionView!.frame.height)
    }
    
    override public func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes {
        return self.itemAttributes[indexPath.row]
    }
    
    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {

        var attributes = [UICollectionViewLayoutAttributes]()
        let filteredArray = itemAttributes.filter({rect.intersects($0.frame)})
        attributes.append(contentsOf: filteredArray)
        return attributes
    }
    
    override public func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }}
