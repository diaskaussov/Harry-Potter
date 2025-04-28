
import UIKit

final class CharachtersPageBackgroundView: UIImageView {
        
    init() {
        super.init(image: UIImage(named: "bluredLib") ?? UIImage())
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
