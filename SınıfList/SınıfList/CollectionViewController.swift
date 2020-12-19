//
//  CollectionViewController.swift
//  SınıfList
//
//  Created by batuhankarasu on 10.12.2020.
//

import UIKit

private let hucreadi = "hucreadi"

struct  Ogrenci {
    var adi : String
    var ogrenciNumarasi : Int
}

class CollectionViewController: UICollectionViewController {
    var seciliİndex = 0
    var ogrenciler : [Ogrenci] = [Ogrenci]()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let satirElemanSayisi : CGFloat = 3
            let bosluk : CGFloat = 4
            let toplamBosluk = bosluk * (satirElemanSayisi - 1)
            let itemBosluk = toplamBosluk / satirElemanSayisi
            
            let genislik = collectionView.frame.width / satirElemanSayisi - itemBosluk
            let yükseklik = genislik
            layout.itemSize = CGSize(width: genislik, height: yükseklik)
            layout.minimumInteritemSpacing = bosluk
            layout.minimumLineSpacing = bosluk
        }
        
        let o1 = Ogrenci(adi: "Veli", ogrenciNumarasi: 1)
        let o2 = Ogrenci(adi: "Yasemin", ogrenciNumarasi: 2)
        let o3 = Ogrenci(adi: "Volkan", ogrenciNumarasi: 3)
        let o4 = Ogrenci(adi: "Zeynep", ogrenciNumarasi: 4)
        let o5 = Ogrenci(adi: "Mehtap", ogrenciNumarasi: 5)
        ogrenciler.append(o1)
        ogrenciler.append(o2)
        ogrenciler.append(o3)
        ogrenciler.append(o4)
        ogrenciler.append(o5)
        
        
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ogrenciler.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: hucreadi, for: indexPath)
        
        if let customCell = cell as? CollectionViewCell {
            customCell.lblogrAdi.text = ogrenciler[indexPath.row].adi
            return customCell
        }
        
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        seciliİndex = indexPath.row
        performSegue(withIdentifier: "detaylar", sender: self)
    }
}

