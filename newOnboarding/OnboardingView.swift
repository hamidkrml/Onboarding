//
//  ContentView.swift
//  newOnboarding
//
//  Created by hamid on 26.01.25.
//

import SwiftUI

struct ContentView: View {
    @State private var  currentPage = 0
    @State private var dragOffset: Bool = true
    
    let onboardingData = [
        OnboardingItem(image: "1",
                       title: "Fitness Uygulaması Hareket Analizi ve Kullanıcı Geri ",
                       description: "Kulancilarin hareketlerini algilayarak veritabanina kayt edip tablo uzerinde gosteren fitness uygulamasi ",
                       accentColor: Color.yellow.opacity(0.8),
                       rotation: 15),
        OnboardingItem(image: "2",
                       title: "Hareket Analizi ",
                       description: " Analiz yapilarak kac tane dogru hareket oldugunu anliyor",
                       accentColor: Color.yellow.opacity(0.8),
                       rotation: -10),
        OnboardingItem(image: "3",
                       title: "Diyet",
                       description: "Öğün üzerıne tıklandıgında onun hakkında bilgi ve nasıl yapıldığı hakkında internet sayfası yönledirecek ",
                       accentColor: Color.yellow.opacity(0.8),
                       rotation: 8)
    ]
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Color.black.ignoresSafeArea()
                ParticlesView()
                    .opacity(0.5)
                LinearGradient(
                    gradient: Gradient(colors: [Color.black,Color.black,Color.clear]), startPoint: .top, endPoint: .bottom
                )
                .ignoresSafeArea()
                
                TabView(selection:$currentPage){
                    ForEach(0..<onboardingData.count, id: \.self) { index in
                        OnboardingPage(item: onboardingData[index], screenWidth: geometry.size.width, islastPage: index == onboardingData.count - 1)
                            .tag(index)
                    }
             
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                VStack{
                    Spacer()
                    PageIndicator(totalPages: onboardingData.count, currentPage: currentPage, accentColor: onboardingData[currentPage].accentColor)
                        .padding(.bottom,20)
                    
                    NavigationButtons(currentPage: $currentPage, totalPages: onboardingData.count, accentColor: onboardingData[currentPage].accentColor)
                        .padding(.bottom,geometry.safeAreaInsets.bottom + 10)
                    
                }

            }
        }
        
    }
}

#Preview {
    ContentView()
}

