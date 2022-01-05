//
//  VideoListItem.swift
//  Africa
//
//  Created by Ezra Bathini on 4/01/22.
//

import SwiftUI

struct VideoListItem: View {
    let video: AnimalVideo
    
    
    
    var body: some View {
        HStack(spacing: 10.0) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                .cornerRadius(8)
                Image(systemName: "play.rectangle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }
            VStack(alignment: .leading, spacing: 10.0) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }
    }
}

struct VideoListItem_Previews: PreviewProvider {
    static var previews: some View {
        VideoListItem(video: testVideos[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
