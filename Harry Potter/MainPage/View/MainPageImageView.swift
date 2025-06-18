
import UIKit

final class MainPageImageView: UIImageView {
    
    init(name: String) {
        super.init(image: UIImage(named: name) ?? UIImage())
        setupImageViewProperties(name: name)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageViewProperties(name: String) {
        contentMode = .scaleAspectFill
        translatesAutoresizingMaskIntoConstraints = false
    }
}
