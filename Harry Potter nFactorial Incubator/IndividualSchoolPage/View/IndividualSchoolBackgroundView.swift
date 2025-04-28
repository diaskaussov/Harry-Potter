
import UIKit

final class IndividualSchoolBackgroundView: UIImageView {
    
    init() {
        super.init(image: UIImage(named: "bluredLib") ?? UIImage())
        setupBackgroundImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBackgroundImage() {
        contentMode = .scaleAspectFill
        isUserInteractionEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
