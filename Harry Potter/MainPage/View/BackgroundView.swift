
import UIKit

final class BackgroundView: UIImageView {
    private enum Constants {
        static let backgroundImage = "brickWall"
    }
    
    init() {
        super.init(image: UIImage(named: Constants.backgroundImage) ?? UIImage())
        setupViewProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewProperties() {
        contentMode = .scaleAspectFill
        isUserInteractionEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
