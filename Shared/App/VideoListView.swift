//
//  VideoListView.swift
//  Africa
//
//  Created by Ezra Bathini on 2/01/22.
//

import SwiftUI

struct VideoListView: View {
    
    
    @State var videos: AnimalVideos = Bundle.main.decode("videos.json")
    
    #if !os(macOS)
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    #endif
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { video in
                    NavigationLink(destination: VideoPlayerView(videoId: video.id, videoTitle: video.name)) {
                        VideoListItem(video: video)
                            .padding(.vertical, 8.0)
                    }
                }
            }
            #if !os(macOS)
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }) {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
            #endif
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
