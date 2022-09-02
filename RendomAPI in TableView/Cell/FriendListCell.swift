//
//  FriendListCell.swift
//  RendomAPI in TableView
//
//  Created by USER on 02/09/2022.
//

import UIKit

class FriendListCell: UITableViewCell {

    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendNameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //  RoundImage
        friendImage.layer.cornerRadius = friendImage.layer.bounds.height/2
        friendImage.clipsToBounds = true
        friendImage.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
