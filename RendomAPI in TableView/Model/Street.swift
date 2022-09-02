
import Foundation

struct Street: Codable {

  var number : Int?    = nil
  var name   : String? = nil

  enum CodingKeys: String, CodingKey {

    case number = "number"
    case name   = "name"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    number = try values.decodeIfPresent(Int.self    , forKey: .number )
    name   = try values.decodeIfPresent(String.self , forKey: .name   )
 
  }

  init() {

  }

}