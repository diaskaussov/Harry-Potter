
import UIKit
import SwiftUI

final class MainViewController: UIViewController {
    private enum Constants {
        static let welcomeText: String =
        "Welcome, traveler!\nAre you ready to dive into the world of Harry Potter?\nIf you are, click here!"
        static let spellText: String = "Tap to explore spells"
        static let backgroundColor: UIColor = .black
        static let platformImageName: String = "platform"
        static let horizontalScrollImageName: String = "horizontalScroll"
        static let spellsInfoImageName: String = "horizontalScroll"
    }
    
    private let backgroundImageView = BackgroundView()
    private let platformImageView = MainPageImageView(name: Constants.platformImageName)
    private let horizontalScrollImageView = MainPageImageView(name: Constants.horizontalScrollImageName)
    private let spellsInfoImageView = MainPageImageView(name: Constants.horizontalScrollImageName)
    private let welcomeText = WelcomeTextLabel(text: Constants.welcomeText)
    private let spellsText = WelcomeTextLabel(text: Constants.spellText)
    
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
        backgroundImageView.addSubview(spellsInfoImageView)
        backgroundImageView.addSubview(horizontalScrollImageView)
        spellsInfoImageView.addSubview(spellsText)
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
            welcomeText.widthAnchor.constraint(equalTo: horizontalScrollImageView.widthAnchor, multiplier: 0.9),
            
            spellsInfoImageView.topAnchor.constraint(equalTo: horizontalScrollImageView.bottomAnchor),
            spellsInfoImageView.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            spellsInfoImageView.widthAnchor.constraint(equalTo: backgroundImageView.widthAnchor, multiplier: 0.6),
            spellsInfoImageView.heightAnchor.constraint(equalTo: backgroundImageView.heightAnchor, multiplier: 0.2),
            
            spellsText.centerXAnchor.constraint(equalTo: spellsInfoImageView.centerXAnchor),
            spellsText.centerYAnchor.constraint(equalTo: spellsInfoImageView.centerYAnchor),
            spellsText.widthAnchor.constraint(equalTo: spellsInfoImageView.widthAnchor, constant: 0.8),
        ])
    }
    
    private func configure() {
        view.backgroundColor = Constants.backgroundColor
        horizontalScrollImageView.isUserInteractionEnabled = true
        horizontalScrollImageView.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(horizontalScrollImageViewTapped))
        )
        spellsInfoImageView.isUserInteractionEnabled = true
        spellsInfoImageView.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(spellsInfoImageViewTapped))
        )
    }
    
    @objc
    private func horizontalScrollImageViewTapped() {
        let vc = HousesPageViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func spellsInfoImageViewTapped() {
        let hc = UIHostingController(rootView: MainContentView())
        navigationController?.pushViewController(hc, animated: true)
    }
}
