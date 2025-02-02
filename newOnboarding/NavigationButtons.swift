//
//  NavigationButtons.swift
//  newOnboarding
//
//  Created by hamid on 27.01.25.
//

import SwiftUI

struct NavigationButtons: View {
    @Binding var currentPage: Int
    let totalPages: Int
    let accentColor: Color
    @State private var arrowOffset: CGFloat = -5
    @State private var arrowOpacity: Double = 0.5
    
    
    var body: some View {
        HStack(spacing:20) {
            if currentPage < totalPages - 1 {
                Button("skip"){
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                        currentPage = totalPages - 1
                    }
                }
                .foregroundColor(.white)
                .opacity(0.8)
                Button{
                    withAnimation(.spring(response : 0.4, dampingFraction: 0.7 )){
                        currentPage += 1
                    }
                    
                }label: {
                    HStack(spacing: 8){
                        Text("next")
                        Image(systemName: "arrow.right")
                            .font(.system(size: 16,weight: .semibold))
                            .offset(x: arrowOffset)
                            .opacity(arrowOpacity)
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 140, height: 50)
                    .background(
                        Capsule()
                            .fill(accentColor)
                            .overlay(Capsule()
                                    
                                .stroke(Color.white.opacity(0.3),lineWidth: 1)
                                    )
                            .shadow(color: accentColor.opacity(0.5), radius: 10, x:0, y: 5)
                    )
                    
                }
                .onAppear {
                    withAnimation(
                        .easeInOut(duration: 1.0)
                        .repeatForever(autoreverses: true)
                    ){
                        arrowOffset = 5
                        arrowOpacity = 1
                    }
                }
                } else {
                    Button {
                        print("get started")
                    } label:{
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width:200, height:50)
                            .background(
                                Capsule()
                                    .fill(accentColor)
                                    .overlay(Capsule()
                                        .stroke(Color.white.opacity(0.3),lineWidth: 1)
                             
                                    
                                    )
                                    .shadow(color: accentColor.opacity(0.5), radius:10, x:0, y:5)
                            )
                    
                }
            }
            
        }
        .padding(.horizontal,32)
    }
}


