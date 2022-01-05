//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Ezra Bathini on 4/01/22.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let videoId, videoTitle: String
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoId, fileFormat: "mp4"))
                .overlay(
                    VideoPlayerOverlayIcon(), alignment: .topLeading
                )
        }
        .accentColor(.accentColor)
        #if os(macOS)
        .navigationTitle(videoTitle)
        #else
        .navigationBarTitle(videoTitle, displayMode: .inline)
        #endif
    }
}

struct VideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(videoId: "cheetah", videoTitle: "Cheetah")
    }
}

struct VideoPlayerOverlayIcon: View {
    var body: some View {
        Image("logo")
            .resizable()
            .frame(width: 32.0, height: 32.0)
            .scaledToFit()
            .padding(.top, 6)
            .padding(.horizontal, 8)
        
    }
}
