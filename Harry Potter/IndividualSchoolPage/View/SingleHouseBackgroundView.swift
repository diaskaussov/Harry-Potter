
import UIKit

final class SingleHouseBackgroundView: UIImageView {
    private enum Constants {
        static let backgroundImageName: String = "bluredLibrary"
    }
    
    init() {
        super.init(image: UIImage(named: Constants.backgroundImageName) ?? UIImage())
        setupBackgroundImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBackgroundImage() {
        contentMode = .scaleAspectFill
        isUserInteractionEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
