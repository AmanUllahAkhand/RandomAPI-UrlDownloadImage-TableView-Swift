//
//  ViewController.swift
//  RendomAPI in TableView
//
//  Created by USER on 02/09/2022.
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let randomRepository = RandomRepository()
    
    private var myData : [Results]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
        setupContainer()
        loadMyData()
    }
    func setupContainer(){
           self.tableView.delegate = self
           self.tableView.dataSource = self
           self.tableView.reloadData()
           self.tableView.separatorColor = UIColor.blue
       }
       
       func loadMyData() {
           randomRepository.getRandomRequest(custId: "50") { success in
               print(success)
             
            if let md = success.results {
                   self.myData = md
               }
             self.tableView.reloadData()
           }
       }
   }
//For Downlode Image:
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
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
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
   extension  ViewController: UITableViewDataSource, UITableViewDelegate {
       
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 100
       }
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return myData?.count ?? 0
       }
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendListCell", for: indexPath) as! FriendListCell
        
           if let md = myData?[indexPath.row] {
            let Name = "\(md.name?.title ?? "") \(md.name?.first ?? "") \(md.name?.last ?? "")"
            cell.friendNameLbl.text = "\( Name )"
               
            let urlString = md.picture?.large
            let url = URL (string: urlString!)
            cell.friendImage.downloaded(from: url!)
          }
         return cell
       }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let StoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let ProfileViewController = StoryBoard.instantiateViewController(identifier: "ProfileViewController") as! ProfileViewController
        if let md = myData?[indexPath.row] {
            ProfileViewController.FriendInformation = md
        }
        
        self.navigationController?.pushViewController(ProfileViewController, animated: true)
    }
    

   }
