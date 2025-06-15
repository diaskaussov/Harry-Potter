
import SwiftUI

struct SpellsListView: View {
    private enum Constants {
        static let wandImageName: String = "wand"
        static let unknownName: String = "Unknown name"
        static let unknownDescription: String = "Unknown description"
        static let textColor: Color = Color(
            UIColor(
                red: 134.0/255.0,
                green: 59.0/255.0,
                blue: 5.0/255.0,
                alpha: 1
            )
        )
    }
    
    let spells: [Spell]
    
    var body: some View {
        List(spells) { spell in
            HStack {
                Spacer()
                VStack {
                    Image(Constants.wandImageName)
                        .resizable()
                        .scaledToFit()
                    Text(spell.name ?? Constants.unknownName)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Constants.textColor)
                    Text(spell.description ?? Constants.unknownDescription)
                        .font(.subheadline)
                        .foregroundColor(Constants.textColor)
                }
                Spacer()
            }
            .background(Color.clear)
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            .padding(.all)
        }
        .listStyle(PlainListStyle())
        .scrollContentBackground(.hidden)
    }
}
