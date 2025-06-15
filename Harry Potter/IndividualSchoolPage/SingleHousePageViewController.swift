
import UIKit

final class SingleHousePageViewController: UIViewController {
    private enum Constants {
        static let backgroundColor: UIColor = .black
        static let scrollImageName: String = "scroll"
        static let textWithoutInfo: String = "No available info"
    }
    
    private let house: HouseModel
    private let houseDescription = HouseDescription()
    private let backgroundView = SingleHouseBackgroundView()
    private let scrollImageView = SingleHouseImageView(
        image: UIImage(named: Constants.scrollImageName) ?? UIImage()
    )
    private lazy var houseImageView = SingleHouseImageView(
        image: UIImage(named: house.name.lowercased()) ?? UIImage()
    )
    private lazy var houseInfoLabel = HouseLabel(
        text: houseDescription.houseInfo[house.name] ?? Constants.textWithoutInfo
    )
    
    init(house: HouseModel) {
        self.house = house
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        configure()
    }
}

//MARK: - Setup View Controller

private extension SingleHousePageViewController {
    private func setupSubviews() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(houseImageView)
        backgroundView.addSubview(scrollImageView)
        scrollImageView.addSubview(houseInfoLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            houseImageView.topAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.topAnchor),
            houseImageView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            houseImageView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.5),
            houseImageView.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.25),
            
            scrollImageView.topAnchor.constraint(equalTo: houseImageView.bottomAnchor),
            scrollImageView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 1.2),
            scrollImageView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            scrollImageView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            
            
            houseInfoLabel.centerYAnchor.constraint(equalTo: scrollImageView.centerYAnchor),
            houseInfoLabel.centerXAnchor.constraint(equalTo: scrollImageView.centerXAnchor),
            houseInfoLabel.widthAnchor.constraint(equalTo: scrollImageView.widthAnchor, multiplier: 0.6)
        ])
    }
    
    private func configure() {
        view.backgroundColor = Constants.backgroundColor
        scrollImageView.isUserInteractionEnabled = true
        scrollImageView.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(horizontalScrollImageViewTapped))
        )
    }
    
    @objc
    private func horizontalScrollImageViewTapped() {
        let vc = CharactersPageViewController(
            house: self.house
        )
        navigationController?.pushViewController(vc, animated: true)
    }
}
