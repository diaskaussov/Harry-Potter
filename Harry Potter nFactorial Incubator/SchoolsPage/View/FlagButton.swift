
import UIKit

protocol FlagButtonDelegate: AnyObject {
    func schoolButtonTapped(for sender: UIButton)
}

final class FlagButton: UIButton {
    
    weak var flagButtonDelegate: FlagButtonDelegate?
    
    private let image: String
    
    init(image: String) {
        self.image = image
        
        super.init(frame: .zero)
        setupButtonConstraints(image: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButtonConstraints(image: String) {
        setImage(UIImage(named: image) ?? UIImage(), for: .normal)
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc
    private func buttonTapped(_ sender: UIButton) {
        flagButtonDelegate?.schoolButtonTapped(for: sender)
    }
}
