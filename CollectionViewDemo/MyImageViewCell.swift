import UIKit

class MyImageViewCell: UICollectionViewCell {
    
    public static let CELL_ID = "MyImageViewCell"

    @IBOutlet weak var photoImage: UIImageView!
    
    public var vm: MyImageViewModel?
    
    func setViewModel(_ vm:MyImageViewModel) {
        self.vm = vm
    
        vm.getImage(completion: {
            [weak self] image in
            self?.photoImage.image = image
        })
    }
}
