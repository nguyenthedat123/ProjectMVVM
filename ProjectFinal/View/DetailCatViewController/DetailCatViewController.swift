//
//  DetailCatViewController.swift
//  ProjectFinal
//
//  Created by The Dat on 7/16/21.
//

import UIKit

class DetailCatViewController: UIViewController {
    
    //MARK: - Bien
    var imgcat = ""
    
    //MARK: - @IBOutlet
    @IBOutlet weak var imgCat: UIImageView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        imgCat.sd_setImage(with: URL(string: imgcat), placeholderImage: UIImage(named: "placeholder.png"))
    }
    
    //MARK: - func
    func bindData(data: CatResponse) {
        imgcat = data.url ?? ""
    }
    
}
