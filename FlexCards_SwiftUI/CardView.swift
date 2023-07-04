//
//  CardView.swift
//  FlexCards_SwiftUI
//
//  Created by Bhavin on 04/07/23.
//

import SwiftUI

struct CardView: View {
    
    let image: String
    let place: String
    let description: String
    let buttonImage: String
    
    let size: CGSize
    let isSelected: Bool
    var onTap: (() -> ())?
    
    var body: some View {
        Image("\(image)")
            .resizable()
            .scaledToFill()
            .frame(width: size.width, height: size.height)
            .cornerRadius(8)
            .clipped()
            .contentShape(Rectangle())
            .overlay(alignment: .bottomLeading) {
                HStack(spacing: 8.0) {
                    Image(systemName: buttonImage)
                        .foregroundColor(.white)
                        .frame(width: 24.0, height: 24.0)
                    if isSelected {
                        VStack(alignment: .leading) {
                            Text(place)
                                .font(.headline)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                            Text(description)
                                .font(.caption2)
                                .foregroundColor(.white)
                        }
                        .fixedSize()
                    }
                }
                .frame(height: 40)
                .padding(4.0)
            }
            .onTapGesture {
                onTap?()
            }
    }
}

#Preview {
    CardView(image: "australia",
             place: "Australia",
             description: "Australia",
             buttonImage: "sun.min.fill",
             size: .init(width: 373, height: 248),
             isSelected: true)
    .previewInterfaceOrientation(.landscapeLeft)
}
