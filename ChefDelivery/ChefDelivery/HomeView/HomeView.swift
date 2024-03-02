//
//  HomeView.swift
//  ChefDelivery
//
//  Created by Pierre Campos Dias on 28/02/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isAnimating = false
    @State private var imageOffset: CGSize = .zero
    @State private var buttonOffset: CGFloat = 0
    @State private var showSecondScreen = false
    private let buttonHeight: CGFloat = 80
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .fill(.colorRed)
                    .frame(width: isAnimating ? 200 : 0)
                    .position(x: isAnimating ? 50 : -50 , y: isAnimating ? 100 : -100)
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 1)
                
                Circle()
                    .fill(.colorRedDark)
                    .frame(width: isAnimating ? 200 : 0)
                    .position(
                        x: isAnimating ?  geometry.size.width - 50 : geometry.size.width  + 50,
                        y: isAnimating ? geometry.size.height - 50 : geometry.size.height + 50)
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 1)
                
                VStack {
                    Text("Chef Delivery")
                        .font(.system(size: 48))
                        .fontWeight(.heavy)
                        .foregroundStyle(.colorRed)
                        .opacity(isAnimating ? 1: 0)
                        .offset(y: isAnimating ? 0 : -40)
                    
                    Text("Peça as suas comidas favoritas no conforto da sua casa.")
                        .font(.title2)
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.black.opacity(0.7))
                        .opacity(isAnimating ? 1: 0)
                        .offset(y: isAnimating ? 0 : -40)
                    
                    Image("home-logo")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 60)
                        .padding(isAnimating ? 32 : 92)
                        .opacity(isAnimating ? 1 : 0)
                        .offset(x: imageOffset.width,  y: imageOffset.height)
                        .gesture(DragGesture().onChanged({ gesture in
                            withAnimation(.easeInOut(duration: 0.5)) {
                                imageOffset = gesture.translation
                            }
                        }).onEnded({ _ in
                            withAnimation(.easeInOut(duration: 0.5)) {
                                imageOffset = .zero
                            }
                        }))
                    
                    ZStack {
                        Capsule()
                            .fill(.colorRed)
                            .opacity(0.2)
                        
                        Capsule()
                            .fill(.colorRed)
                            .opacity(0.2)
                            .padding(8)
                        
                        Text("Descubra mais")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.colorRedDark)
                            .offset(x: 20)
                        
                        HStack {
                            Capsule()
                                .fill(.colorRed)
                                .frame(width: buttonOffset + buttonHeight)
                            Spacer()
                        }
                        
                        HStack {
                            ZStack {
                                Circle()
                                    .fill(.colorRed)
                                
                                Circle()
                                    .fill(.colorRedDark)
                                    .padding(8)
                                
                                Image(systemName: "chevron.right.2")
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }
                        .offset(x: buttonOffset)
                        .gesture(DragGesture().onChanged({ gesture in
                            if gesture.translation.width >= 0 &&
                                gesture.translation.width <= (geometry.size.width - 60) - buttonHeight {
                                withAnimation(.easeInOut(duration: 0.25)) {
                                    buttonOffset = gesture.translation.width
                                }
                            }
                        }).onEnded({ _ in
                            if buttonOffset > (geometry.size.width - 60) / 2 {
                                showSecondScreen = true
                            } else {
                                withAnimation(.easeInOut(duration: 0.25)) {
                                    buttonOffset = 0
                                }
                            }
                        }))
                        
                    }
                    .frame(width: geometry.size.width - 60, height: buttonHeight)
                    .opacity(isAnimating ? 1 : 0)
                    
                }.onAppear {
                    withAnimation(.easeInOut(duration: 1)) {
                        isAnimating = true
                    }
                }.preferredColorScheme(.light)
            }
        }
        .fullScreenCover(isPresented: $showSecondScreen, content: {
            ContentView()
        })
    }
}

#Preview {
    HomeView()
}
