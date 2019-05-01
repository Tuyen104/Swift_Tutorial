//
//  MainViewController.swift
//  UserProfile
//
//  Created by Le Tuyen on 4/17/19.
//  Copyright © 2019 Le Tuyen. All rights reserved.
//

import UIKit
import SVProgressHUD
import ObjectMapper
import AFNetworking
import RealmSwift



class MainViewController: UIViewController {
    @IBOutlet weak var avaBorderView : UIView!
    @IBOutlet weak var avaImageView : UIImageView!
    @IBOutlet weak var addNewButton : UIView!
    @IBOutlet weak var followButton : UIButton!
    @IBOutlet weak var shotsButton : UIButton!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var locationLabel : UILabel!
    @IBOutlet weak var likesLabel : UILabel!
    @IBOutlet weak var photosLabel : UILabel!
    @IBOutlet weak var collectionsLabel : UILabel!
    @IBOutlet weak var collectionView : UICollectionView!
    
    
    var photos : [Photo] = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.avaBorder(avaBorderView)
        self.avaBorder(avaImageView)
        self.addNewCircle(addNewButton)
        self.followButton.layer.cornerRadius = 18
        self.setupCollectionView()
        self.requestAction()
        
        //print("\(self.photos[0].color)")
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //self.navigationItem.title = self.photos[0].users?.username
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_leftBar")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(leftBarBtn(_ : )))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_rightBar")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(leftBarBtn(_:)))
    }
    @objc fileprivate func leftBarBtn(_ sender : UIBarButtonItem){
        
    }
    
    fileprivate func setupCollectionView(){
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        let nib = UINib(nibName: "MainCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "MainCollectionViewCell")
    }
    
    fileprivate func avaBorder(_ avaView : UIView){
        avaView.layer.cornerRadius = avaView.frame.size.width/2.0
        avaView.layer.borderWidth = 1
        avaView.layer.borderColor = UIColor(red:0.30, green:0.85, blue:0.39, alpha:1.0).cgColor
    }
    fileprivate func addNewCircle(_ avaView : UIView){
        avaView.backgroundColor = UIColor(red:0.30, green:0.85, blue:0.39, alpha:1.0)
        avaView.layer.cornerRadius = avaView.frame.size.width/2.0
        avaView.layer.borderWidth = 2
        avaView.layer.borderColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0).cgColor

    }
    fileprivate func avaBorder(_ avaImage : UIImageView){
        avaImage.layer.cornerRadius = avaImage.frame.size.width/2.0
        avaImage.layer.borderWidth = 1
        avaImage.layer.borderColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0).cgColor
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
       return self.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        cell.updateImageWithUrl(self.photos[indexPath.item].urlImage)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
extension MainViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthItem = (UIScreen.main.bounds.size.width - 20*3)/2
        return CGSize(width: widthItem, height: widthItem)
    }
}

//let endPoint : String = "https://api.unsplash.com/users/kaspercph/photos?client_id=b4c9f248833db2bb34344a0f4abe7448fbb1950593372aa423856b63afccb4cb"
typealias hud = SVProgressHUD
let environment = Environment(.dev, host: "https://api.unsplash.com")

//var apiData = [String : Any]()

extension MainViewController{
    func requestAction(){
        hud.show()
        let dispatcher = NetworkDispatcherManager(environment: environment)
        Photo.dowork(in: dispatcher, completion: {(result) in
            DispatchQueue.main.async { [weak self] in
                guard let `self` = self else { return }
                hud.dismiss()
                switch result {
                case .success(_):
                    
                    //guard let photos = photos as? [Photo] else {return}
                    //self.photos = photos
                    
                    self.nameLabel.text = self.photos[0].users?.name
                    self.locationLabel.text = self.photos[0].users?.location
                    if let profileUrl = self.photos[0].users?.profileImage{
                    self.avaImageView.loadImageWithUrl(profileUrl)
                    }
                    if let likes = self.photos[0].users?.likes{
                    self.likesLabel.text = String(describing: likes)
                    }
                    if let photos = self.photos[0].users?.photos{
                    self.photosLabel.text = String(describing: photos)
                    }
                    if let collections = self.photos[0].users?.collections{
                    self.collectionsLabel.text = String(describing: collections)
                    }
                    self.navigationItem.title = self.photos[0].users?.username
                    self.collectionView.reloadData()
                case .failure(let error):
                    print("ERROR: \(error)")
                }
            }
            
        }
        )
        
//        guard let url = URL(string: endPoint) else {return}
//        let param : JSObject = [
//            "client_id" : "b4c9f248833db2bb34344a0f4abe7448fbb1950593372aa423856b63afccb4cb"
//        ]
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
        
 //       hud.show()

//        let task = URLSession.shared.dataTask(with: request){(data, response, error) in
//            DispatchQueue.main.async { [weak self] in
//                guard let `self` = self else {return}
//                hud.dismiss()
//
//                if let response = response{
//                    print("RESPONSE: \(response)")
//                }
//                if let error = error{
//                    print("ERROR: \(error.localizedDescription)")
//                }
//                if let data = data{
//                    do{
//                        let jsarray = try JSONSerialization.jsonObject(with: data, options: []) as! JSArray
//                        self.photos = Mapper<Photo>().mapArray(JSONArray: jsarray)
////                        if let name = self.photos[0].users?.name {
////                            print("\(name)")
////                            self.nameLabel.text = name
////                        }
//                        self.nameLabel.text = self.photos[0].users?.name
//                        self.locationLabel.text = self.photos[0].users?.location
//                        if let profileUrl = self.photos[0].users?.profileImage{
//                            self.avaImageView.loadImageWithUrl(profileUrl)
//                        }
//                        if let likes = self.photos[0].users?.likes{
//                            self.likesLabel.text = String(describing: likes)
//                        }
//                        if let photos = self.photos[0].users?.photos{
//                            self.photosLabel.text = String(describing: photos)
//                        }
//                        if let collections = self.photos[0].users?.collections{
//                            self.collectionsLabel.text = String(describing: collections)
//                        }
//                        self.navigationItem.title = self.photos[0].users?.username
//                        self.collectionView.reloadData()
//                        }
//
//                    catch{
//                        print("ERROR MAPPING JSON: \(error.localizedDescription)")
//                    }
//                }
//            }
//
//        }
//        task.resume()
//    }
}
}
