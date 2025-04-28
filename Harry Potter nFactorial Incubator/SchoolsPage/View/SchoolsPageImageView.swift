
import UIKit

final class SchoolsPageImageView: UIImageView {
    
    init(name: String) {
        super.init(image: UIImage(named: name) ?? UIImage())
        setupImageViewProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageViewProperties() {
        contentMode = .scaleAspectFill
        isUserInteractionEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
