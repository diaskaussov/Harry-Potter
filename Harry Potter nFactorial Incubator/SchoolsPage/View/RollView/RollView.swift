
import UIKit

final class RollView: UIView {
    
    private let back: SchoolsPageImageView
    
    private let label: RollLabel
    
    init() {
        self.back = SchoolsPageImageView(name: "scroll")
        
        self.label = RollLabel()
        
        super.init(frame: .zero)
        setupViewProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Setup Properties

private extension RollView {
    
    private func setupViewProperties() {
        
        self.addSubview(back)
        back.addSubview(label)
        
        NSLayoutConstraint.activate([
            back.topAnchor.constraint(equalTo: self.topAnchor),
            back.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            back.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            back.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            label.centerXAnchor.constraint(equalTo: back.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: back.centerYAnchor),
            label.widthAnchor.constraint(equalTo: back.widthAnchor, multiplier: 0.7),
            label.heightAnchor.constraint(equalTo: back.heightAnchor, multiplier: 0.7),
        ])
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
