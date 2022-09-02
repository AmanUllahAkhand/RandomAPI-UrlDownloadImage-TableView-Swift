
import Foundation

struct Results: Codable {

  var gender     : String?     = nil
  var name       : Name?       = Name()
  var location   : Location?   = Location()
  var email      : String?     = nil
  var login      : Login?      = Login()
  var dob        : Dob?        = Dob()
  var registered : Registered? = Registered()
  var phone      : String?     = nil
  var cell       : String?     = nil
  var id         : Id?         = Id()
  var picture    : Picture?    = Picture()
  var nat        : String?     = nil

  enum CodingKeys: String, CodingKey {

    case gender     = "gender"
    case name       = "name"
    case location   = "location"
    case email      = "email"
    case login      = "login"
    case dob        = "dob"
    case registered = "registered"
    case phone      = "phone"
    case cell       = "cell"
    case id         = "id"
    case picture    = "picture"
    case nat        = "nat"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    gender     = try values.decodeIfPresent(String.self     , forKey: .gender     )
    name       = try values.decodeIfPresent(Name.self       , forKey: .name       )
    location   = try values.decodeIfPresent(Location.self   , forKey: .location   )
    email      = try values.decodeIfPresent(String.self     , forKey: .email      )
    login      = try values.decodeIfPresent(Login.self      , forKey: .login      )
    dob        = try values.decodeIfPresent(Dob.self        , forKey: .dob        )
    registered = try values.decodeIfPresent(Registered.self , forKey: .registered )
    phone      = try values.decodeIfPresent(String.self     , forKey: .phone      )
    cell       = try values.decodeIfPresent(String.self     , forKey: .cell       )
    id         = try values.decodeIfPresent(Id.self         , forKey: .id         )
    picture    = try values.decodeIfPresent(Picture.self    , forKey: .picture    )
    nat        = try values.decodeIfPresent(String.self     , forKey: .nat        )
 
  }

  init() {

  }

}