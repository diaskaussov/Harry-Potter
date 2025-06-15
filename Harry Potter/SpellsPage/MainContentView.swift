
import SwiftUI

struct MainContentView: View {
    private enum Constants {
        static let headlineText: String = "SPELLS"
        static let textColor: Color = Color(
            UIColor(
                red: 134.0/255.0,
                green: 59.0/255.0,
                blue: 5.0/255.0,
                alpha: 1
            )
        )
        static let backgroundColorForText: Color = Color(
            UIColor(
                red: 214.0/255.0,
                green: 187.0/255.0,
                blue: 124.0/255.0,
                alpha: 1
            )
        )
    }
    
    @StateObject private var spellsPageManager = SpellsPageManager()
    
    var body: some View {
        ZStack {
            SpellsBackgroundImageView()
            VStack(spacing: 0) {
                Text(Constants.headlineText)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Constants.textColor)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Constants.backgroundColorForText)
                    )
                SpellsListView(spells: spellsPageManager.spells)
            }
        }
    }
}
