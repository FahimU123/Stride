//
//  ContentView.swift
//  Stride
//
//  Created by Fahim Uddin on 10/2/24.
//

import SwiftUI

struct ContentView: View {
    
    
    
    @State private var isTimerRunning = false
    @State private var currentPrompt = ""
    @State private var timeElapsed: Double = 0.00
    @State private var showInfo = false
    @State private var showStory = false
    @State private var showAlert = false

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var colors: [Color] = [.customRed, .customBlack, .customLightBlack]
    
    var button: Color = .buttons
    
    @State var promptInput: String = ""
    @State var UserAnswer: [String] = [""]
    
    @State private var prompts = ["Once upon a time", "Every day", "But one day", "Because of that", "Until finally", "And ever since"]
    @State private var currentIndex: Int = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: colors, startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Text("Quote of the Day")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.top, 30)
                    
                    Quote()
                        .foregroundColor(.white)
                        .padding(.vertical, 30)

                   
                    Text("Time Elapsed: \(Int(timeElapsed) / 60):\(String(format: "%02d", Int(timeElapsed) % 60))")
                        .foregroundColor(.white)
                        .onReceive(timer) { _ in
                            if isTimerRunning {
                                timeElapsed += 1
                            }
                        }
                    
                    Button("\(isTimerRunning ? "Stop" : "Start")") {
                        isTimerRunning.toggle()
                    }
                    .buttonStyle(.bordered)
                    .tint(Color.buttons)
                    .padding(.vertical, 30)
                    
                    
                    Text(prompts[currentIndex])
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.vertical)
                    
                    TextField("Type answer here", text: $promptInput)
                        .submitLabel(.done)
                        .onSubmit {
                            let storyyy = "\(prompts[currentIndex]) \(promptInput)"
                            UserAnswer.append(storyyy)
                            promptInput = ""
                            if currentIndex == prompts.count - 1 {
                                showStory = true
                                isTimerRunning = false
                            } else {
                                currentIndex += 1
                            }
                            
                        }
                        .padding()
                        .foregroundColor(.black)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            showInfo.toggle()
                        }) {
                            Text("Info")
                            Image(systemName: "info.circle.fill")
                                .buttonStyle(.bordered)
                                .foregroundColor(.buttons)
                        }
                        .sheet(isPresented: $showInfo) {
                            InfoView()
                        }
                        .padding()
                        
                        Button(action: {}) {
                            Text("Archive")
                            Image(systemName: "printer.fill")
                                .buttonStyle(.bordered)
                                .foregroundColor(.buttons)
                        }
                        .padding()
                        
                        Button(action: {
                            
                            showAlert = true
                        }) {
                            Text("Refresh")
                            Image(systemName: "arrow.clockwise.circle.fill")
                                .buttonStyle(.bordered)
                                .foregroundColor(.buttons)
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Refresh"),
                                primaryButton: .destructive(Text("Yes"), action: {
                                    currentIndex = 0
                                }),
                                secondaryButton: .cancel()
                            )
                        }

                    }
                        
                        .padding()
                    
                    .padding(.bottom, 20)
                }
                .foregroundColor(.white)
                
                NavigationLink(
                                  destination: StoryView(compiledStory: UserAnswer.joined(separator: " ")),
                                  isActive: $showStory,
                                  label: { EmptyView() }
                              )            }
        }
    }
}

#Preview {
    ContentView()
}
