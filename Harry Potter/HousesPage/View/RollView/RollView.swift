
import UIKit

final class RollView: UIView {
    private enum Constants {
        static let scrollImageName: String = "scroll"
    }
    
    private let backView = HousePageImageView(name: Constants.scrollImageName)
    private let label = RollLabel()
    
    init() {
        super.init(frame: .zero)
        setupViewProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewProperties() {
        self.addSubview(backView)
        backView.addSubview(label)
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: self.topAnchor),
            backView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            label.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            label.widthAnchor.constraint(equalTo: backView.widthAnchor, multiplier: 0.7),
            label.heightAnchor.constraint(equalTo: backView.heightAnchor, multiplier: 0.7),
        ])
        translatesAutoresizingMaskIntoConstraints = false
    }
}
