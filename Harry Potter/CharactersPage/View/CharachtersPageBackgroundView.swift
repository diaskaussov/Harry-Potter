
import UIKit

final class CharachtersPageBackgroundView: UIImageView {
    private enum Constants {
        static let backgroundImageName: String = "bluredLibrary"
    }
    
    init() {
        super.init(image: UIImage(named: Constants.backgroundImageName) ?? UIImage())
        setupBackgroundProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBackgroundProperties() {
        contentMode = .scaleAspectFill
        isUserInteractionEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
