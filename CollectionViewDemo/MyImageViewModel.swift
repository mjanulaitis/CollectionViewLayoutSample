
import UIKit
import Foundation

class MyImageViewModel: NSObject {
    
    var endPoint:String
    
    init(_ endPoint:String) {
        self.endPoint = endPoint
    }
    
    func getImage(completion: @escaping (_ image:UIImage?) -> Void) {
        
        DispatchQueue.global().async {
            
            if let url = URL(string: self.endPoint) {
                
                URLSession.shared.dataTask(with: url) { data, response, error in
                    
                    if let data = data {
                        DispatchQueue.main.async {
                            completion(UIImage(data: data))
                        }
                    }
                    
                }.resume()
            }
        }
    }
}
