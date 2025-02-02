//
//  SwiftUIView.swift
//  newOnboarding
//
//  Created by hamid on 27.01.25.
//

import SwiftUI

struct PageIndicator: View {
    let totalPages: Int
    let currentPage: Int
    let accentColor: Color
    var body: some View {
        HStack(spacing:12){
            ForEach(0..<totalPages, id: \.self){ index in
                Capsule()
                    .fill(currentPage == index ? accentColor : Color.white.opacity(0.3))
                    .frame(width: currentPage == index ? 20 : 8, height: 8  )
                    .animation(.spring, value: currentPage)
            }
        }
    }
}


