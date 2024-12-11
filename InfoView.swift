//
//  InfoView.swift
//  Stride
//
//  Created by Fahim Uddin on 10/8/24.
//

import Foundation
import SwiftUI

struct InfoView: View{
    var body : some View {
        let colors: [Color] = [.customRed, .customBlack, .customLightBlack]
        
        ZStack {
            LinearGradient(colors: colors, startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                
                Text("How the Game Works:")
                
                ScrollView {
                    Text("""
                 
                 1. Start the Timer: Click start to begin the timer and start answering your prompt
                 
                 2. Walk & Prompt: After each prompt is completed, there will be a 1 minute pause, before you get a new prompt to answer. There are 6 prompts you must answer before a story can be provided.
            
                 3. Finish the Prompts: Once you've completed all the prompts, your walk ends.
            
                 4. Story Time: A story is generated based on your responses using story spine prompts.
                 
            """)
                    .padding()
                }
                
                
            }
            
        }
        .background(Color.black)
    }
}
