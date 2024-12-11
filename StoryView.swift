//
//  StoryView.swift
//  Stride
//
//  Created by Fahim Uddin on 10/9/24.
//

import SwiftUI
import UIKit

    
struct StoryView: View {
    
    
    var compiledStory: String
    @State private var title: String = "Title"
    var colors: [Color] = [.customRed, .customBlack, .customLightBlack]
    
   
    
    var body: some View {
    //    NavigationView {
            ZStack {
                LinearGradient(colors: colors, startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Text("Your Story")
                        .navigationTitle($title)
                        .navigationBarTitleTextColor(.white)
                        .padding()
                        .fontWeight(.bold)
                        .font(.title)
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbarRole(.editor)
                        
                    ScrollView {
                        Text(compiledStory)
                            .padding()
                            .font(.body)
                    }
                    
                    Spacer()
                }
                .padding()
                .foregroundColor(.white)
            }
            .foregroundColor(.white)
      //  }
    }
}

#Preview {
    StoryView(compiledStory: "Sample story")
}




extension View {
    @available(iOS 14, *)
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
        return self
    }
}
