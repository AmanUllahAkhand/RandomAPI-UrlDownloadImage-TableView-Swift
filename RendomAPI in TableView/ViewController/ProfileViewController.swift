//
//  ProfileViewController.swift
//  RendomAPI in TableView
//
//  Created by USER on 02/09/2022.
//

import UIKit
//For Downlode Image:
extension UIImageView {
    func downloaded1(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded1(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var phoneNoLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var hirthdayLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
   
    
    
    var FriendInformation : Results?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        profileImage.layer.cornerRadius = 50
        profileImage.clipsToBounds = true
        profileImage.contentMode = .scaleAspectFill
        
        let Name = "\(FriendInformation?.name?.title ?? "") \(FriendInformation?.name?.first ?? "") \(FriendInformation?.name?.last ?? "")"
   
        let Address = "\(FriendInformation?.location?.city ?? "") , \(FriendInformation?.location?.country ?? "")"
        
        fullNameLbl.text = "\(Name)"
        addressLbl.text = "\(Address)"
        phoneNoLbl.text = "\(FriendInformation?.phone ?? "")"
        emailLbl.text = "\(FriendInformation?.email ?? "")"
        emailLbl.textColor = .blue
       // hirthdayLbl.text = "\(FriendInformation?.dob?.date ?? "")"
        ageLbl.text = "\(FriendInformation?.dob?.age ?? 0)"
        genderLbl.text = "\(FriendInformation?.gender?.capitalized ?? "")"
        
        
        //Date Formate Change:
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let showDate = inputFormatter.date(from: "\(FriendInformation?.dob?.date ?? "")")
        inputFormatter.dateFormat = "MMM d, yyyy"
        let resultString = inputFormatter.string(from: showDate!)
        self.hirthdayLbl.text = "\(resultString)"
        
        
        let urlString = FriendInformation?.picture?.large
        let url = URL (string: urlString!)
        profileImage.downloaded1(from: url!)
    }
    

  
}

