import UIKit

var MyJson = """
{
  "optionsMenu": [
    {
      "id": 1,
      "name": "Restaurantes",
      "active": true,
      "colorHex": "#FC0000",
      "colorRgb": [
        252,
        0,
        0
      ]
    },
    {
      "id": 2,
      "name": "Mercados",
      "active": true,
      "colorHex": "#16B158",
      "colorRgb": [
        22,
        177,
        88
      ]
    },
    {
      "id": 3,
      "name": "Alcohol",
      "active": true,
      "colorHex": "#F5008D",
      "colorRgb": [
        245,
        0,
        141
      ]
    },
    {
      "id": 4,
      "name": "Farmacias",
      "active": true,
      "colorHex": "#4DCFFF",
      "colorRgb": [
        77,
        207,
        255
      ]
    },
    {
      "id": 5,
      "name": "Envios",
      "active": true,
      "colorHex": "#991CF5",
      "colorRgb": [
        153,
        28,
        245
      ]
    },
    {
      "id": 6,
      "name": "Mascotas",
      "active": true,
      "colorHex": "#FA0A82",
      "colorRgb": [
        250,
        10,
        130
      ]
    },
    {
      "id": 7,
      "name": "Tiendas",
      "active": true,
      "colorHex": "#340FFF",
      "colorRgb": [
        52,
        15,
        255
      ]
    },
    {
      "id": 8,
      "name": "Café & Tortas",
      "active": true,
      "colorHex": "#F4AA05",
      "colorRgb": [
        244,
        170,
        5
      ]
    }
  ],
  "promotionalHome": [
    {
      "id": 1,
      "title": "Platos imbatibles 01",
      "subtitle": "Platos económicos en tu zona 01",
      "image": "https://s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2019/04/18204648/hamburguesas1.jpg",
      "commerceInfo": {
        "name": "Mcdonalds",
        "category": "Fast food"
      }
    },
    {
      "id": 1,
      "title": "Platos imbatibles 02",
      "subtitle": "Platos económicos en tu zona 02",
      "image": "https://www.doggis.cl/wp-content/uploads/sites/2/2018/03/hot-dogs-1.jpg",
      "commerceInfo": {
        "name": "Doggis",
        "category": "Fast food"
      }
    },
    {
      "id": 1,
      "title": "Platos imbatibles 02",
      "subtitle": "Platos económicos en tu zona 02",
      "image": "https://restauracionnews.com/wp-content/uploads/2019/09/GuacamoleBigAngus.jpg",
      "commerceInfo": {
        "name": "Carl Jr",
        "category": "Fast food"
      }
    }
  ]
}
"""

public struct CommerceInfo : Codable {
    let name: String
    let category: String
}

struct HomeInfo : Codable {
       struct optionsMenu : Codable {
              let id: Int
              let name: String
              let active: Bool
              let colorHex: String
              let colorRgb: [Int]
           enum CodingKeys : String, CodingKey {
             case id
             case name
             case active
             case colorHex
             case colorRgb
           }
       }
    
     struct promotionalHome : Codable {
            let id: Int
            let title: String
            let subtitle: String
            let image: String
            let commerceInfo: CommerceInfo
        enum CodingKeys : String, CodingKey {
            case id
            case title
            case subtitle
            case image
            case commerceInfo
          }
      }
    
   let optionsMenu: [optionsMenu]
   let promotionalHome: [promotionalHome]
}


let decoder = JSONDecoder()
if let jsonData = MyJson.data(using: .utf8){
do {
   let response = try decoder.decode(HomeInfo.self, from: jsonData)
    print(response) //Output - EMT
} catch { print(error) }
}
