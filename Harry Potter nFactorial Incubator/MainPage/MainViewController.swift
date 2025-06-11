
import UIKit

final class MainViewController: UIViewController {
    private enum Constants {
        static let backgroundColor: UIColor = .black
        static let platformImageName: String = "platform"
        static let horizontalScrollImageName: String = "horizontalScroll"
    }
    
    private let backgroundImageView = BackgroundView()
    private let platformImageView = MainPageImageView(name: Constants.platformImageName)
    private let horizontalScrollImageView = MainPageImageView(name: Constants.horizontalScrollImageName)
    private let welcomeText = WelcomeTextLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        configure()
    }
}

//MARK: - Setup View Controller

private extension MainViewController {
    private func setupSubviews() {
        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(platformImageView)
        backgroundImageView.addSubview(horizontalScrollImageView)
        horizontalScrollImageView.addSubview(welcomeText)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            platformImageView.topAnchor.constraint(equalTo: backgroundImageView.safeAreaLayoutGuide.topAnchor),
            platformImageView.widthAnchor.constraint(equalTo: backgroundImageView.widthAnchor, multiplier: 0.4),
            platformImageView.heightAnchor.constraint(equalTo: backgroundImageView.heightAnchor, multiplier: 0.2),
            platformImageView.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            
            horizontalScrollImageView.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            horizontalScrollImageView.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor, constant: 50),
            horizontalScrollImageView.widthAnchor.constraint(equalTo: backgroundImageView.widthAnchor, multiplier: 0.8),
            horizontalScrollImageView.heightAnchor.constraint(equalTo: backgroundImageView.heightAnchor, multiplier: 0.35),
            
            welcomeText.centerYAnchor.constraint(equalTo: horizontalScrollImageView.centerYAnchor),
            welcomeText.centerXAnchor.constraint(equalTo: horizontalScrollImageView.centerXAnchor),
            welcomeText.widthAnchor.constraint(equalTo: horizontalScrollImageView.widthAnchor, multiplier: 0.9)
        ])
    }
    
    private func configure() {
        view.backgroundColor = Constants.backgroundColor
        horizontalScrollImageView.isUserInteractionEnabled = true
        horizontalScrollImageView.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(horizontalScrollImageViewTapped))
        )
    }
    
    @objc
    private func horizontalScrollImageViewTapped() {
        let vc = HousesPageViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
