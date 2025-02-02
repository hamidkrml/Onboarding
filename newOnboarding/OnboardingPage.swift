//
//  OnboardingPage.swift
//  newOnboarding
//
//  Created by hamid on 27.01.25.
//

import SwiftUI
struct OnboardingItem{
    let image: String
    let title: String
    let description: String
    let accentColor: Color
    let rotation: Double
}


struct OnboardingPage: View {
    let item: OnboardingItem
    let screenWidth: CGFloat
    var islastPage:Bool
    
    @State private var isAnimating = false
    @State private var imageScale: CGFloat = 1.1
    @State private var imageOffset: CGFloat = -20
    @State private var imageRotation: Double = 5
    @State private var textOpacity: Double = 0
    @State private var textOffset: CGFloat = 30
    var body: some View{
        GeometryReader { geometry in
            VStack(spacing: 40){
                ZStack{
                    Image(item.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.6)
                        .scaleEffect(imageScale)
                        .offset(y: imageOffset)
                        .rotationEffect(.degrees(imageRotation))
                        .clipped()
                        .mask(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    .clear,
                                    .white,
                                    .white,
                                    .white,
                                    .clear
                                ]), startPoint: .top, endPoint: .bottom
                            )
                        )
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    .black.opacity(0.3),
                                    .clear,
                                    .black.opacity(0.5)
                                ]), startPoint: .top, endPoint: .bottom
                            )
                        )
                }
                .frame(height: geometry.size.height * 0.6)
                
                VStack(spacing: 25){
                    Text(item.title)
                        .font(.system(size: 33,weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .opacity(textOpacity)
                        .offset(y: textOffset)
                    Text(item.description)
                        .font(.system(size: 18,weight: .light))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal,32)
                        .opacity(textOpacity)
                        .offset(y: textOffset)
                }
                .padding(.top, -20)
                Spacer()
                    .frame(height: 100)
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .onAppear{
                withAnimation(.spring(response: 0.5, dampingFraction: 0.8).delay(0.3)) {
                    imageScale = 1.0
                    imageOffset = 0
                    imageRotation = 0
                    
                }
                withAnimation(.spring(response: 0.5, dampingFraction: 0.8).delay(0.3)) {
                    textOpacity = 1
                    textOffset = 0
                    
                    
                }
                withAnimation(
                    .easeInOut(duration: 4)
                    .repeatForever(autoreverses: true)
                )
                {
                    imageScale = 1.05
                    imageOffset = -10
                }
            }
            .onChange(of: item.image){ _ in
                imageScale = 1.1
                imageOffset = -20
                imageRotation = 5
                textOffset = 30
                
                withAnimation(.spring(response: 0.8,dampingFraction: 0.8)){
                    imageScale = 1.0
                    imageOffset = 0
                    imageRotation = 0
                    
                }
                withAnimation(.spring(response: 0.8,dampingFraction: 0.8).delay(0.3)){
                    imageScale = 1.0
                    imageOffset = 0
                    imageRotation = 0
                    
                }
                
            }
        }
        
    }
}


