//
//  StartView.swift
//  School_TimeTable
//
//  Created by 王竣翔 on 2022/8/31.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        
        VStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(minWidth: 0, maxWidth: 150
                       , minHeight: 0, maxHeight: 100)
                .foregroundColor(.blue)
                .overlay(
                    Text("歡迎使用課表通")
                        .font(.system(.largeTitle,design: .rounded))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    
                )
            Button(action: {
                
            }){
                Text("點擊來開始")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .padding(10)
            }
            
            
        }
        .ignoresSafeArea()
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}

