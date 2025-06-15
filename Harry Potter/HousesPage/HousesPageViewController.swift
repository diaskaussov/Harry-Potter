
import UIKit

final class HousesPageViewController: UIViewController {
    private enum Constants {
        static let backgroundColor: UIColor = .black
        static let owlImageName: String = "owl"
        static let bluredLibraryImageName: String = "bluredLibrary"
    }
    
    private let rollView = RollView()
    private let gryffindor = FlagButton(houseType: .gryffindor)
    private let hufflepuff = FlagButton(houseType: .hufflepuff)
    private let ravenclaw = FlagButton(houseType: .ravenclaw)
    private let slytherin = FlagButton(houseType: .slytherin)
    private let backgroundView = HousePageImageView(name: Constants.bluredLibraryImageName)
    private let owlView = HousePageImageView(name: Constants.owlImageName)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        configure()
    }
}

//MARK: - Setup View Controller

private extension HousesPageViewController {
    private func setupSubviews() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(owlView)
        backgroundView.addSubview(gryffindor)
        backgroundView.addSubview(slytherin)
        backgroundView.addSubview(hufflepuff)
        backgroundView.addSubview(ravenclaw)
        backgroundView.addSubview(rollView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            gryffindor.trailingAnchor.constraint(equalTo: backgroundView.centerXAnchor, constant: -5),
            gryffindor.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.4),
            gryffindor.topAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.topAnchor),
            gryffindor.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.2),
            
            slytherin.leadingAnchor.constraint(equalTo: backgroundView.centerXAnchor, constant: 5),
            slytherin.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.4),
            slytherin.topAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.topAnchor),
            slytherin.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.2),
            
            hufflepuff.trailingAnchor.constraint(equalTo: backgroundView.centerXAnchor, constant: -5),
            hufflepuff.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.4),
            hufflepuff.topAnchor.constraint(equalTo: gryffindor.bottomAnchor, constant: 10),
            hufflepuff.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.2),
            
            ravenclaw.leadingAnchor.constraint(equalTo: backgroundView.centerXAnchor, constant: 5),
            ravenclaw.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.4),
            ravenclaw.topAnchor.constraint(equalTo: slytherin.bottomAnchor, constant: 10),
            ravenclaw.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.2),
            
            owlView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 5),
            owlView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.4),
            owlView.topAnchor.constraint(equalTo: hufflepuff.bottomAnchor, constant: 50),
            owlView.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.2),
            
            rollView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            rollView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.6),
            rollView.topAnchor.constraint(equalTo: hufflepuff.bottomAnchor, constant: 30),
            rollView.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.35)
        ])
    }
    
    private func configure() {
        view.backgroundColor = Constants.backgroundColor
        gryffindor.flagButtonDelegate = self
        hufflepuff.flagButtonDelegate = self
        ravenclaw.flagButtonDelegate = self
        slytherin.flagButtonDelegate = self
    }
}

//MARK: - FlagButtonDelegate

extension HousesPageViewController: FlagButtonDelegate {
    func flagButtonTapped(for houseType: HouseType) {
        let vc = SingleHousePageViewController(
            house: HouseModel(
                image: UIImage(named: houseType.rawValue) ?? UIImage(),
                name: houseType.rawValue.capitalized,
                color: houseType.color
            )
        )
        navigationController?.pushViewController(vc, animated: true)
    }
}
