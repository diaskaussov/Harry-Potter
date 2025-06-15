
import UIKit

final class CharacterProfileImageView: UIImageView {
    private enum Constants {
        static let cornerRadius: CGFloat = 10
        static let borderWidth: CGFloat = 3
        static let borderColor: CGColor = UIColor(
            red: 134/255,
            green: 59/255,
            blue: 5/255,
            alpha: 1
        ).cgColor
    }
    
    init(image: UIImage) {
        super.init(image: image)
        setupProfileImageProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProfileImageProperties() {
        clipsToBounds = true
        layer.cornerRadius = Constants.cornerRadius
        layer.borderWidth = Constants.borderWidth
        layer.borderColor = Constants.borderColor
        contentMode = .scaleToFill
        isUserInteractionEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
