import UIKit

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    var vms:[MyImageViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vms.append(MyImageViewModel("https://res.cloudinary.com/liftopia/image/upload/b_transparent,c_pad,g_center,h_175,w_263/v1512090339/production/logos/f2bc897dc48bb93586182e49fc9e1397.png"))
        vms.append(MyImageViewModel("https://www.alta.com/ui/alta/img/alta-80th-blue.png"))
        vms.append(MyImageViewModel("https://d1pdyfnmzhu191.cloudfront.net/content/img/mammothmtn/mmsa2017/mammoth-logo-trans.png"))
        vms.append(MyImageViewModel("https://res.cloudinary.com/liftopia/image/upload/b_transparent,c_pad,g_center,h_175,w_263/v1512090339/production/logos/f2bc897dc48bb93586182e49fc9e1397.png"))
        vms.append(MyImageViewModel("https://www.alta.com/ui/alta/img/alta-80th-blue.png"))
        vms.append(MyImageViewModel("https://d1pdyfnmzhu191.cloudfront.net/content/img/mammothmtn/mmsa2017/mammoth-logo-trans.png"))
        vms.append(MyImageViewModel("https://res.cloudinary.com/liftopia/image/upload/b_transparent,c_pad,g_center,h_175,w_263/v1512090339/production/logos/f2bc897dc48bb93586182e49fc9e1397.png"))
        vms.append(MyImageViewModel("https://www.alta.com/ui/alta/img/alta-80th-blue.png"))
        vms.append(MyImageViewModel("https://d1pdyfnmzhu191.cloudfront.net/content/img/mammothmtn/mmsa2017/mammoth-logo-trans.png"))
        let myLayout = MyLayout()
        myLayout.initialize(vms)
        
        collectionView!.register(UINib(nibName: MyImageViewCell.CELL_ID, bundle: nil), forCellWithReuseIdentifier: MyImageViewCell.CELL_ID)
        collectionView!.delegate = self
        collectionView!.dataSource = self
        collectionView.setCollectionViewLayout(myLayout, animated: true)
    }
}

extension ViewController: UICollectionViewDelegate {
    
    // Called when an item is about to be displayed.
    // Sets the view model.
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if let myCell = cell as? MyImageViewCell {
            myCell.setViewModel(vms[indexPath.row])
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    
    // Gets the  number of sections in the table.
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Gets the number of items in the section.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vms.count
    }
    
    // Gets the reusable bookmarks cell.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return collectionView.dequeueReusableCell(withReuseIdentifier: MyImageViewCell.CELL_ID, for: indexPath) as! MyImageViewCell
    }
}

