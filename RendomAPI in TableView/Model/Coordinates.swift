
import Foundation

struct Coordinates: Codable {

  var latitude  : String? = nil
  var longitude : String? = nil

  enum CodingKeys: String, CodingKey {

    case latitude  = "latitude"
    case longitude = "longitude"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    latitude  = try values.decodeIfPresent(String.self , forKey: .latitude  )
    longitude = try values.decodeIfPresent(String.self , forKey: .longitude )
 
  }

  init() {

  }

}