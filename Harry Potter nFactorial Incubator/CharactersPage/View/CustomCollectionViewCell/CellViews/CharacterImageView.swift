
import UIKit

final class CharacterImageView: UIImageView {
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
    
    init() {
        super.init(frame: .zero)
        setupImageViewProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageViewProperties() {
        layer.cornerRadius = Constants.cornerRadius
        layer.borderWidth = Constants.borderWidth
        layer.borderColor = Constants.borderColor
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
