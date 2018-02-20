//
//  ViewController.swift
//  CollectionViewCustomLayout
//
//  Created by Priyaranjan samal on 2/16/18.
//  Copyright © 2018 Priyaranjan Samal. All rights reserved.
//

import UIKit

//The valid range of latitude in degrees is -90 and +90 for the southern and northern hemisphere respectively. Longitude is in the range -180 and +180 specifying coordinates west and east of the Prime Meridian, respectively.

let apiKey = "1dcce1934c6e59ef21921caf6b7113a1"
let url = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=1dcce1934c6e59ef21921caf6b7113a1&lat=40.8&lon=122.8&radius=1&radius_units=mi&per_page=40&format=json&nojsoncallback=1"

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.delegate = self
        collectionView.dataSource = self
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.cellLabel.text = items[indexPath.item];
        cell.contentView.backgroundColor = randomColor()
        return cell
    }
    
    func randomColor() -> UIColor {
        let randomRed: CGFloat = CGFloat(drand48())
        let randomGreen: CGFloat = CGFloat(drand48())
        let randomBlue: CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
}

extension MainViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        
        return items[indexPath.item].image.size.height
    }
}






