//
//  BarcodeViewController.swift
//  ShopCard
//
//  Created by Martin Simonovski on 7/22/18.
//  Copyright © 2018 Martin Simonovski. All rights reserved.
//

import UIKit
import CoreImage

class BarcodeViewController: UIViewController {
    var card: FirestoreCardModel? = nil
    @IBOutlet weak var cardNameLbl: UILabel!
    @IBOutlet weak var barcodeImg: UIImageView!
    @IBOutlet weak var barcodeLbl: UILabel!
    @IBOutlet weak var ownerLbl: UILabel!
    @IBOutlet weak var typeImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        barcodeImg.image = generateBarcode(from: (card?.barcode)!)
        cardNameLbl.text = card?.name
        barcodeLbl.text = card?.barcode
        typeImg.image = UIImage(named: (card?.getImageName())!)
        ownerLbl.text = card?.owner
    }

    func generateBarcode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CICode128BarcodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            
            return UIImage(ciImage: (filter.outputImage)!)
        }
        
        return nil
    }

}
