
import UIKit

protocol CloseButtonDelegate: AnyObject {
    func closeButtonTapped()
}

final class CloseButton: UIButton {
    
    weak var delegate: CloseButtonDelegate?
    
    init() {
        super.init(frame: .zero)
        setupButtonProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButtonProperties() {
        setTitle("Close", for: .normal)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 8
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(
            red: 134.0/255.0,
            green: 59.0/255.0,
            blue: 5.0/255.0,
            alpha: 1
        )
    }
    
    @objc
    private func buttonTapped(_ sender: UIButton) {
        delegate?.closeButtonTapped()
    }
}
