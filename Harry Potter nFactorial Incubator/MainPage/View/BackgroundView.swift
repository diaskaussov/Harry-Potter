
import UIKit

final class BackgroundView: UIImageView {
    
    init() {
        super.init(image: UIImage(named: "RealBackround") ?? UIImage())
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
