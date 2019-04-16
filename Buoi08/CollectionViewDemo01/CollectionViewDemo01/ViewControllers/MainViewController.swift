//
//  MainViewController.swift
//  CollectionViewDemo01
//
//  Created by Le Tuyen on 4/7/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import UIKit
import SVProgressHUD
typealias hud = SVProgressHUD

class MainViewController: UIViewController {
    @IBOutlet weak var collectionView : UICollectionView!
    var urlStrings : [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCollectionView()
        self.requestAction()
    }
    
    fileprivate func setCollectionView(){
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        let nib = UINib(nibName: "MainCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "MainCollectionViewCell")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MainViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urlStrings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        cell.updateImageViewWithURL(urlStrings[indexPath.row])
        return cell
    }
}
extension MainViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthCell = (UIScreen.main.bounds.size.width-16*3)/2
        return CGSize(width: widthCell, height: widthCell)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
}
let endPoint : String = "http://api.giphy.com/v1/gifs/search?q=ryan+gosling&api_key=yiqzM4Jv03uxAXShha84CIaJdtJOXjjw"
typealias JSObject = [String: Any]
typealias JSArray = [JSObject]
//typealias hud = SVProgressHUD

extension MainViewController{
    func requestAction(){
        guard let url = URL(string: endPoint) else {return}
        let param : JSObject = [
        "q": "ryan+gosling",
        "api_key": "yiqzM4Jv03uxAXShha84CIaJdtJOXjjw",
        "limit": "5"
        ]
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        hud.show()
        let task = URLSession.shared.dataTask(with: request){(data, response, error) in DispatchQueue.main.async { [weak self] in
            guard let `self` = self else {return}
            hud.dismiss()
            
            if let response = response {
                print("RESPONSE: \(response)")
            }
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            }
            if let data = data{
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! JSObject
                    let data = json["data"] as! JSArray
                    var urlJsons = [String]()
                    for obj in data{
                        if let images = obj["images"] as? JSObject,
                            let smallImage = images["fixed_height_small"] as? JSObject,
                            let url = smallImage["url"] as? String
                        {
                            urlJsons.append(url)
                        }
                        
                    }
                    self.urlStrings = urlJsons
                    self.collectionView.reloadData()
                }
                catch{
                    print("ERROR MAPPING JSON: \(error.localizedDescription)")
                }
            }
            }}
        task.resume()
        
    }
}
