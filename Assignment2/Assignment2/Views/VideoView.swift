//
//  VideoView.swift
//  Assignment2
//
//  Created by Yashraj jadhav on 05/02/23.
//

import SwiftUI
import AVKit
import AVFoundation

struct VideoView: View {
    var video : Video
    
    @State private var player = AVPlayer()
    
    var body: some View {
        VideoPlayer(player: player).edgesIgnoringSafeArea(.all)
            .onAppear{
                if let link =  video.videoFiles.first?.link {
                    player = AVPlayer(url: URL(string: link)!)
                    // automatic play video
                    player.play()
                }
            }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(video: previewVideo)
    }
}
