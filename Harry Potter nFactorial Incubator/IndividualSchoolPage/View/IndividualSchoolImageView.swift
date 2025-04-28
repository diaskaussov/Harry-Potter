
import UIKit

protocol IndividualSchoolImageViewDelegate: AnyObject {
    func scrollImageTapped()
}

final class IndividualSchoolImageView: UIImageView {
    
    weak var delegate: IndividualSchoolImageViewDelegate?
    
    init(image: UIImage, isScroll: Bool) {
        super.init(image: image)
        setupImageViewProperties(isScroll: isScroll)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageViewProperties(isScroll: Bool) {
        
        if isScroll {
            contentMode = .scaleAspectFill
            isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
            addGestureRecognizer(tapGesture)
        }
        
        contentMode = .scaleToFill
        isUserInteractionEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc
    private func imageTapped() {
        delegate?.scrollImageTapped()
    }
}
