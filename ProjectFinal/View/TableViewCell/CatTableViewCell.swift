//
//  CatTableViewCell.swift
//  ProjectFinal
//
//  Created by The Dat on 7/15/21.
//

import UIKit
import SDWebImage

class CatTableViewCell: UITableViewCell {

    //MARK: - @IBOutlet
    @IBOutlet weak var imgCat: UIImageView!
    
    //MARK: override
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - func
    func bindData(data: CatResponse) {
        imgCat.sd_setImage(with: URL(string: data.url), placeholderImage: UIImage(named: "placeholder.png"))
    }
    
}
