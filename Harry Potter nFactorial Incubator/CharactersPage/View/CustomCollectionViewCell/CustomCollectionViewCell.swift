
import UIKit

final class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    private let nameLabel: CellLabel
    
    private let isStudentLabel: CellLabel
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "paper") ?? UIImage())
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let studentImageView: UIImageView = {
        let image = UIImageView(image: UIImage())
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        self.nameLabel = CellLabel()
        
        self.isStudentLabel = CellLabel()
        
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(
        name: String?,
        image: UIImage?,
        isStudent: String,
        houseLetter: String
    ) {
        nameLabel.text = name ?? "Unknown"
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        isStudentLabel.text = isStudent
        
        studentImageView.image = image ?? UIImage(named: houseLetter) ?? UIImage()
    }
}

//MARK: - Setup Constraints

private extension CustomCollectionViewCell {
    private func addSubviews() {
        self.addSubview(backgroundImage)
        backgroundImage.addSubview(studentImageView)
        backgroundImage.addSubview(nameLabel)
        backgroundImage.addSubview(isStudentLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
//            studentImageView.topAnchor.constraint(equalTo: backgroundImage.safeAreaLayoutGuide.topAnchor),
            studentImageView.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor, constant: -8),
            studentImageView.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            studentImageView.widthAnchor.constraint(equalTo: backgroundImage.widthAnchor, multiplier: 0.7),
            studentImageView.heightAnchor.constraint(equalTo: backgroundImage.heightAnchor, multiplier: 0.5),
            
            nameLabel.topAnchor.constraint(equalTo: studentImageView.bottomAnchor, constant: 2),
            nameLabel.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            nameLabel.widthAnchor.constraint(equalTo: backgroundImage.widthAnchor),
            
            isStudentLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            isStudentLabel.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            isStudentLabel.widthAnchor.constraint(equalTo: backgroundImage.widthAnchor),
        ])
    }
}
