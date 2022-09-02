
import Foundation

struct Picture: Codable {

  var large     : String? = nil
  var medium    : String? = nil
  var thumbnail : String? = nil

  enum CodingKeys: String, CodingKey {

    case large     = "large"
    case medium    = "medium"
    case thumbnail = "thumbnail"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    large     = try values.decodeIfPresent(String.self , forKey: .large     )
    medium    = try values.decodeIfPresent(String.self , forKey: .medium    )
    thumbnail = try values.decodeIfPresent(String.self , forKey: .thumbnail )
 
  }

  init() {

  }

}