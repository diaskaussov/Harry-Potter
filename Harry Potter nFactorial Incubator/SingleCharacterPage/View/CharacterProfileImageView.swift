
import UIKit

final class CharacterProfileImageView: UIImageView {
    
    init(image: UIImage) {
        super.init(image: image)
        setupProfileImageProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProfileImageProperties() {
        contentMode = .scaleToFill
        isUserInteractionEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
