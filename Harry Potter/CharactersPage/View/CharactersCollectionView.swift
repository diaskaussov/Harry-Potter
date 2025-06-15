
import UIKit

final class CharactersCollectionView: UICollectionView {
    private enum Constants {
        static let minimalLineSpacing: CGFloat = 0
        static let minimumInteritemSpacing: CGFloat = 10
    }
    
    private let layout = UICollectionViewFlowLayout()
    
    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        setupLayout()
        seturCollectionViewProperties()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = Constants.minimalLineSpacing
        layout.minimumInteritemSpacing = Constants.minimumInteritemSpacing
    }
    
    private func seturCollectionViewProperties() {
        self.register(
            CustomCollectionViewCell.self,
            forCellWithReuseIdentifier: CustomCollectionViewCell.identifier
        )
        backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

