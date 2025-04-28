
import UIKit

protocol MainPageImageViewDelegate: AnyObject {
    func didScrollImageTapped()
}

final class MainPageImageView: UIImageView {
    
    weak var delegate: MainPageImageViewDelegate?
    
    init(name: String) {
        super.init(image: UIImage(named: name) ?? UIImage())
        setupImageViewProperties(name: name)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageViewProperties(name: String) {
        if name == "horscroll" {
            isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
            addGestureRecognizer(tapGesture)
        }
        
        contentMode = .scaleAspectFill
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc
    private func imageTapped() {
        delegate?.didScrollImageTapped()
    }
}
