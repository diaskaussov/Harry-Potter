
import UIKit

final class BackgroundImageView: UIImageView {
    private enum Constants {
        static let imageName: String = "paper"
    }
    
    init() {
        super.init(image: UIImage(named: Constants.imageName) ?? UIImage())
        setupImageViewProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageViewProperties() {
        contentMode = .scaleAspectFit
        translatesAutoresizingMaskIntoConstraints = false
    }
}
