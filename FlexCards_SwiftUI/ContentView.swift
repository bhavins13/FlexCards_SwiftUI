//
//  ContentView.swift
//  FlexCards_SwiftUI
//
//  Created by Bhavin on 04/07/23.
//

import SwiftUI

struct Card: Identifiable, Hashable {
    var id: Int
    var imageName: String
    var place: String
    var description: String
}

let cards: [Card] = [.init(id: 1, imageName: "australia", place: "Australia", description: "Australia"),
                     .init(id: 2, imageName: "austria", place: "Austria", description: "Austria"),
                     .init(id: 3, imageName: "belgium", place: "Belgium", description: "Belgium"),
                     .init(id: 4, imageName: "bhutan", place: "Bhutan", description: "Bhutan"),
                     .init(id: 5, imageName: "brazil", place: "Brazil", description: "Brazil"),
                     .init(id: 6, imageName: "canada", place: "Canada", description: "Canada"),
                     .init(id: 7, imageName: "egypt", place: "Egypt", description: "Egypt"),
                     .init(id: 8, imageName: "maldives", place: "Maldives", description: "Maldives")]


struct ContentView: View {
    
    @State var isSelected = cards[1]
    @State var selectedSize: CGFloat = 0
    @State var size: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text("Popular Countries")
                    .fontWeight(.medium)
                    .font(.largeTitle)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 4.0) {
                        ForEach(cards) { card in
                            CardView(image: card.imageName,
                                     place: card.place,
                                     description: card.description,
                                     buttonImage: isSelected == card ? "sun.min.fill" : "sun.min",
                                     size: .init(width: isSelected == card ? selectedSize : size, height: 248), isSelected: isSelected == card) {
                                withAnimation(.easeIn(duration: 0.2)) {
                                    isSelected = card
                                }
                            }
                        }
                    }
                }
                .onAppear {
                    let basicSize: CGFloat = geometry.size.width - 16.0 - (CGFloat)(8 * (cards.count - 1))
                    selectedSize = basicSize / 2
                    size = (basicSize * 0.5) / (CGFloat)(cards.count - 1)
                    print("selectedSize: \(selectedSize) size: \(size)")
                }
            }
        }
        .padding(8)
    }
}

#Preview {
    ContentView()
}
