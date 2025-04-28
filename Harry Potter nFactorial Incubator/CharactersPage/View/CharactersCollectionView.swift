
import UIKit

final class CharactersCollectionView: UICollectionView {
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 10
        
        super.init(frame: .zero, collectionViewLayout: layout)
        seturCollectionViewProperties()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

