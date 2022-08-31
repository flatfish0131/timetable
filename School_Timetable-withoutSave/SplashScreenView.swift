//
//  SplashScreenView.swift
//  School_TimeTable
//
//  Created by 王竣翔 on 2022/8/31.
//

import SwiftUI

// Costom View Builder
struct SplashScreenView<Content: View,Title: View,Logo: View>: View {
    
    var content: Content
    var titleView: Title
    var logoView: Logo
    
    init(@ViewBuilder content: @escaping () -> Content,@ViewBuilder titleview: @escaping () -> Title,@ViewBuilder logoview: @escaping () -> Logo){
        self.content = content()
        self.titleView = titleView
        self.logoView = logoView
    }
    
    // Animation Properties
    @State var textAnimation = false
    @State var imageAnimation = false
    @State var endAnimation = false
    
    // NameSpace
    @Namespace var animation
    
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                Color("blue")
                    .background(Color(.blue))
                titleView
                    .offset(y:textAnimation ? 0 : 110)
                if !imageAnimation{
                    logoView
                        .matchedGeometryEffect(id: "logo", in: animation)
                }
                // Moving Right
                HStack{
                    
                    //Later Used for nav Buttons
                    Spacer()
                    if imageAnimation{
                        logoView
                            .matchedGeometryEffect(id: "logo", in: animation)
                    }
                }
            }
        }
        .onAppear{
            // Starting Animation with some delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                withAnimation(.spring()){
                    textAnimation.toggle()
                }
                // Next Image Animation
                withAnimation(Animation.easeIn(duration: 1.5)){
                    textAnimation.toggle()
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
