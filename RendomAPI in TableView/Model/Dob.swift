
import Foundation

struct Dob: Codable {

  var date : String? = nil
  var age  : Int?    = nil

  enum CodingKeys: String, CodingKey {

    case date = "date"
    case age  = "age"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    date = try values.decodeIfPresent(String.self , forKey: .date )
    age  = try values.decodeIfPresent(Int.self    , forKey: .age  )
 
  }

  init() {

  }

}