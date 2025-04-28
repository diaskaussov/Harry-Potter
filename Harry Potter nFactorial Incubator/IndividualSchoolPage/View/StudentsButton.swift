
import UIKit

protocol StudentsButtonDelegate: AnyObject {
    func studentsButtonTapped()
}

final class StudentsButton: UIButton {
    
    weak var studentsButtonDelegate: StudentsButtonDelegate?
    
    init() {
        super.init(frame: .zero)
        setupButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButtonConstraints() {
        backgroundColor = .green
        setTitle("Show characters", for: .normal)
        setTitleColor(.black, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        layer.cornerRadius = 10
        layer.borderColor = CGColor(
            red: 0.0/255.0,
            green: 0.0/255.0,
            blue: 0.0/255.0,
            alpha: 1
        )
    }
    
    @objc
    private func buttonTapped(_ sender: UIButton) {
        studentsButtonDelegate?.studentsButtonTapped()
    }
}
