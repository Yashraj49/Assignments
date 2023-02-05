//
//  ContentView.swift
//  Assignment1
//
//  Created by Yashraj jadhav on 05/02/23.
//

 //MARK: -  Sites refered to build this application
// https://developer.apple.com/documentation/avfoundation/offline_playback_and_storage/using_avfoundation_to_play_and_persist_http_live_streams - Apple Developer

// https://www.kodeco.com/22372639-video-streaming-tutorial-for-ios-getting-started - Kodeco (previously known as raywenderlich)
// StackOverflow - https://stackoverflow.com/

import SwiftUI
import AVFoundation
import AVKit


struct ContentView: View {
    var body: some View {
       
        Home()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    @State  var SavedVid = false
    @State var index = 0
    @State var top = 0
    @State var data = [
        Video(id: 0, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video4", ofType: "mp4")!)), replay: false),
        Video(id: 1, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video5", ofType: "mp4")!)), replay: false),
        Video(id: 2, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video2", ofType: "mp4")!)), replay: false),
        Video(id: 3, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video3", ofType: "mp4")!)), replay: false),
        Video(id: 4, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video1", ofType: "mp4")!)), replay: false),
        Video(id: 5, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video6", ofType: "mp4")!)), replay: false),
               ]
    
    var body : some View {
        ZStack{
            
            PlayerScroollView(data: self.$data  )
            
            VStack{
                
                HStack(spacing : 15){
                   
                    Button(action: {
                        
                        self.top = 0
                        
                    }) {
                        
                        Text("Following")
                            .foregroundColor(self.top == 0 ? .white : Color.white.opacity(0.45))
                            .fontWeight(self.top == 0 ? .bold : .none).padding(.vertical)
                        
                    }
                    
                    Button(action: {
                        
                        self.top = 1
                        
                    }) {
                        
                        Text("ForYou")
                            .foregroundColor(self.top == 0 ? .white : Color.white.opacity(0.45))
                            .fontWeight(self.top == 1 ? .bold : .none).padding(.vertical)
                        
                    }
                    
                }
                
                Spacer()
                
                HStack{
                    
                Spacer()
                    
                    VStack(spacing : 35){
                        Button(action: {
                            
                        }) {
                            Image("pic")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 55 , height: 55)
                                .clipShape(Circle())
                                
                        }
                        
                        Button(action: {
                            
                        }) {
                            VStack(spacing : 10) {
                                Image(systemName: "suit.heart.fill").font(.title).foregroundColor(.white)
                                
                                Text("22K").foregroundColor(.white)
                            }
                        }
                     
                     Button(action: {
                         
                     }) {
                         VStack(spacing : 10) {
                             Image(systemName: "chevron.down.square").font(.title).foregroundColor(.white)
                             
                             Text("1021").foregroundColor(.white)
                             
                         }
                         .sheet(isPresented: $SavedVid){
                             
                         }
                     }
                     
                     Button(action: {
                         
                     }) {
                         VStack(spacing : 10) {
                             Image(systemName: "arrowshape.turn.up.right.fill").font(.title).foregroundColor(.white)
                             
                             Text("Share").foregroundColor(.white)
                         }
                     }
                     
                    }
                    .padding(.bottom , 55)
                    .padding(.trailing)
                }
                
            HStack(spacing: 0){
                
                Button(action: {
                    
                    self.index = 0
                    
                }) {
                    Image("home")
                        .resizable()
                        .frame(width: 25 , height : 25 )
                        .foregroundColor(self.index == 0 ? .white : Color.white.opacity(0.35))
                        .padding(.horizontal)
                }
                
                Spacer(minLength: 0)
                
                Button(action: {
                    
                    self.index = 1
                    
                }) {
                    Image("search")
                        .resizable()
                        .frame(width: 25 , height : 25 )
                        .foregroundColor(self.index == 1 ? .white : Color.white.opacity(0.35))
                        .padding(.horizontal)
                }
                
                Spacer(minLength: 0)
                
                Button(action: {
                    
                    
                    
                }) {
                    Image(systemName: "squareshape.split.2x2")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 25 , height : 35 )
                        .padding(.horizontal)
                }
                
                Spacer(minLength: 0)
                
                Button(action: {
                    
                    self.index = 2
                    
                }) {
                    Image("comment")
                        .resizable()
                        .frame(width: 25 , height : 25 )
                        .foregroundColor(self.index == 0 ? .white : Color.white.opacity(0.35))
                        .padding(.horizontal)
                }
                
                Spacer(minLength: 0)
                
                Button(action: {
                    
                    self.index = 3
                    
                }) {
                    Image("profile")
                        .resizable()
                        .frame(width: 25 , height : 25 )
                        .foregroundColor(self.index == 3 ? .white : Color.white.opacity(0.35))
                        .padding(.horizontal)
                }
            }.padding(.horizontal)
            }
            
            //  all edges are ignored
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.bottom,
                     (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 5)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all )
    }
    
}
//MARK: - https://stackoverflow.com/questions/73628714/swiftui-using-an-array-of-ints-that-is-wrapped-with-binding
// used to Know how to bind the data 
struct PlayerView : View {
    
    @Binding var data : [Video]
    
    var body : some View {
        VStack(spacing: 0){
            
            ForEach(0..<self.data.count){i in
                    
                ZStack{
                    
                    Player(player: self.data[i].player)
                        // full screensize because were going to make paging...
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .offset(y: -5)
                    
                    if self.data[i].replay{
                        
                        Button(action: {
                            
                            // playing the video again...
                            
                            self.data[i].replay = false
                            self.data[i].player.seek(to: .zero)
                            self.data[i].player.play()
                            
                        }) {
                            
                            Image(systemName: "goforward")
                            .resizable()
                            .frame(width: 55, height: 60)
                            .foregroundColor(.white)
                        }
                    }
                    
                }
            }
        }
        .onAppear{
            
            
            // for first video a scrooll view is not dragget yet
            self.data[0].player.play()
            
            self.data[0].player.actionAtItemEnd = .none
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.data[0].player.currentItem, queue: .main) { (_) in
                
                // notification to identify at the end of the video...
                
                // enabling replay button....
                self.data[0].replay = true
            }        }
        
    }
}



struct Player : UIViewControllerRepresentable {
    
    var player : AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        
        let view = AVPlayerViewController()
        view.player = player
        view.showsPlaybackControls = false
        view.videoGravity = .resizeAspectFill
        return view
        
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}

class Host : UIHostingController<ContentView>{
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}


// vidoes for playing (SAMPLE)

struct Video : Identifiable {
    
    var id : Int
    var player : AVPlayer
    var replay : Bool
}

struct PlayerScroollView : UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        
        return PlayerScroollView.Coordinator(parent1: self)
        
        
    }
    
    
    
    
    @Binding var data : [Video]
    
    func makeUIView(context: Context) ->  UIScrollView {
        let view  = UIScrollView()
        
        let childView = UIHostingController(rootView: PlayerView(data: self.$data))
        
        // each children occoupies full screen so height = count....
        childView.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        
        view.contentSize = CGSize(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        
        view.addSubview(childView.view)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        
        // for ignoring safe area
        view.contentInsetAdjustmentBehavior = .never
        view.isPagingEnabled = true
        view.delegate = context.coordinator
        
        return view
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        uiView.contentSize = CGSize(width:UIScreen.main.bounds.width, height:
                                        UIScreen.main.bounds.height * CGFloat((data.count)))
        
        for i in 0..<uiView.subviews.count{
            uiView.subviews[i].frame = CGRect(x: 0, y: 0, width:UIScreen.main.bounds.width, height:
                                                UIScreen.main.bounds.height * CGFloat((data.count)))
        }
    }
    
    class Coordinator : NSObject,UIScrollViewDelegate{
        
        var parent : PlayerScroollView
        var index = 0
        
        init (parent1 : PlayerScroollView) {
            
            parent = parent1
            
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            
            let curentindex = Int(scrollView.contentOffset.y / UIScreen.main.bounds.height)
            
            if index != curentindex {
                index = curentindex
                
                // pausing all other vids
                for i in 0..<parent.data.count{
                    parent.data[i].player.seek(to: .zero)
                    parent.data[i].player.pause()
                    
                }
                
                // playing next videos...
                parent.data[index].player.play()
                
                parent.data[index].player.actionAtItemEnd = .none
                
                NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: parent.data[index].player.currentItem, queue: .main) { (_) in
                    
                    // notification to identify at the end of the video...
                    
                    // enabling replay button....
                    self.parent.data[self.index].replay = true
                }
            }
            
        }
    }
}



