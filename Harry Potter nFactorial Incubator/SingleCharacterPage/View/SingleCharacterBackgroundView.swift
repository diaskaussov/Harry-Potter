
import UIKit

final class SingleCharacterBackgroundView: UIImageView {
    
    init() {
        super.init(image: UIImage(named: "paper") ?? UIImage())
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
