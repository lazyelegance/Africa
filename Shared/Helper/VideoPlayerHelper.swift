//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Ezra Bathini on 4/01/22.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer? {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat) else {
        return nil
    }
    
    videoPlayer = AVPlayer(url: url)
    videoPlayer?.play()
    return videoPlayer
}
