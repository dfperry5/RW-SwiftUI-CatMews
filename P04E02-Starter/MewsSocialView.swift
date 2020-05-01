//
//  MewsSocialView.swift
//  P04E02-Starter
//
//  Created by Dylan Perry on 4/30/20.
//  Copyright © 2020 Laurie Gray. All rights reserved.
//

import SwiftUI

struct MewsSocialView: View {
    
    @State private var isShared = false
    
    @ObservedObject var post: MewsPost
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation{
                    self.post.isLiked.toggle()
                }
            }) {
                Text(verbatim: "Like 👍")
                    .foregroundColor(.primary)
                    .padding([.leading, .trailing], 10)
                    .padding([.top, .bottom], 5)
                    .opacity(self.post.isLiked ? 1 : 0.5)
                    .saturation(self.post.isLiked ? 1 : 0.5)
            }
            
            Button(action: {
                self.isShared = true
            }) {
                Text(verbatim: "Share 🎉")
                    .foregroundColor(.primary)
                    .padding([.leading, .trailing], 10)
                    .padding([.top, .bottom], 5)
                    .background(Color.secondary)
                    .border(Color.white, width: 3)
            }
            .alert(isPresented: self.$isShared) {
                Alert(title: Text("Shared"))
            }
        }
    }
}

struct MewsSocialView_Previews: PreviewProvider {
    static var previews: some View {
        MewsSocialView(post: MewsPost.demoPosts.randomElement()!)
    }
}
