
import Foundation

struct Login: Codable {

  var uuid     : String? = nil
  var username : String? = nil
  var password : String? = nil
  var salt     : String? = nil
  var md5      : String? = nil
  var sha1     : String? = nil
  var sha256   : String? = nil

  enum CodingKeys: String, CodingKey {

    case uuid     = "uuid"
    case username = "username"
    case password = "password"
    case salt     = "salt"
    case md5      = "md5"
    case sha1     = "sha1"
    case sha256   = "sha256"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    uuid     = try values.decodeIfPresent(String.self , forKey: .uuid     )
    username = try values.decodeIfPresent(String.self , forKey: .username )
    password = try values.decodeIfPresent(String.self , forKey: .password )
    salt     = try values.decodeIfPresent(String.self , forKey: .salt     )
    md5      = try values.decodeIfPresent(String.self , forKey: .md5      )
    sha1     = try values.decodeIfPresent(String.self , forKey: .sha1     )
    sha256   = try values.decodeIfPresent(String.self , forKey: .sha256   )
 
  }

  init() {

  }

}