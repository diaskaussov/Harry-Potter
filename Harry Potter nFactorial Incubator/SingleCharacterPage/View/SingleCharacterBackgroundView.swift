
import UIKit

final class SingleCharacterBackgroundView: UIImageView {
    private enum Constants {
        static let backgroundImageName: String = "paper"
    }
    
    init() {
        super.init(image: UIImage(named: Constants.backgroundImageName) ?? UIImage())
        setupBackgroundView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBackgroundView() {
        contentMode = .scaleAspectFill
        isUserInteractionEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
