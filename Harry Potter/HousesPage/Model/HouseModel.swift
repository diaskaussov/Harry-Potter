
import Foundation
import UIKit

struct HouseModel {
    let image: UIImage
    let name: String
    let color: UIColor
}

enum HouseType: String {
    case gryffindor
    case hufflepuff
    case ravenclaw
    case slytherin
    
    var color: UIColor {
        switch self {
        case .gryffindor:
            return UIColor(
                red: 149.0/255.0,
                green: 38.0/255.0,
                blue: 31.0/255.0,
                alpha: 1.0
            )
        case .hufflepuff:
            return UIColor(
                red: 249.0/255.0,
                green: 218.0/255.0,
                blue: 103.0/255.0,
                alpha: 1.0
            )
        case .ravenclaw:
            return UIColor(
                red: 48.0/255.0,
                green: 112.0/255.0,
                blue: 170.0/255.0,
                alpha: 1.0
            )
        case .slytherin:
            return UIColor(
                red: 57.0/255.0,
                green: 114.0/255.0,
                blue: 86.0/255.0,
                alpha: 1.0
            )
        }
    }
}
