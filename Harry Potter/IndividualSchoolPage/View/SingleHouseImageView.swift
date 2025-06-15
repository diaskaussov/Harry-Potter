
import UIKit

final class SingleHouseImageView: UIImageView {
    
    init(image: UIImage) {
        super.init(image: image)
        setupImageViewProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageViewProperties() {
        contentMode = .scaleToFill
        isUserInteractionEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
