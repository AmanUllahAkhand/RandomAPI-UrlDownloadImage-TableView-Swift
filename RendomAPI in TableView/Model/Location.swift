
import Foundation

struct Location: Codable {

  var street      : Street?      = Street()
  var city        : String?      = nil
  var state       : String?      = nil
  var country     : String?      = nil
  var postcode    : String?         = nil
  var coordinates : Coordinates? = Coordinates()
  var timezone    : Timezone?    = Timezone()

  enum CodingKeys: String, CodingKey {

    case street      = "street"
    case city        = "city"
    case state       = "state"
    case country     = "country"
    case postcode    = "postcode"
    case coordinates = "coordinates"
    case timezone    = "timezone"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    street      = try values.decodeIfPresent(Street.self      , forKey: .street      )
    city        = try values.decodeIfPresent(String.self      , forKey: .city        )
    state       = try values.decodeIfPresent(String.self      , forKey: .state       )
    country     = try values.decodeIfPresent(String.self      , forKey: .country     )
    
    do {
        postcode    = try values.decodeIfPresent(String.self         , forKey: .postcode    )
    } catch{
       if let typeValue =  try values.decodeIfPresent(Int.self, forKey: .postcode) {
            postcode = "\(typeValue)"
        }
    }
    
    
    
    coordinates = try values.decodeIfPresent(Coordinates.self , forKey: .coordinates )
    timezone    = try values.decodeIfPresent(Timezone.self    , forKey: .timezone    )
 
  }

  init() {

  }

}

