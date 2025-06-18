
import SwiftUI

struct SpellsBackgroundImageView: View {
    private enum Constants {
        static let backgroundImageName: String = "paperForSpells"
    }
    
    var body: some View {
        GeometryReader { geometry in
            Image(Constants.backgroundImageName)
                .resizable()
                .scaledToFill()
                .frame(
                    width: geometry.size.width,
                    height: geometry.size.height * 1.5
                )
                .ignoresSafeArea(.all)
        }
    }
}
