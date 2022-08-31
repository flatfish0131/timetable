//
//  ContentView.swift
//  School_TimeTable
//
//  Created by Poter Pan on 2022/8/8.
//

import SwiftUI

struct ContentView: View {
    let titles = ["週一", "週二", "週三", "週四", "週五"]
    
    let cols = Array(repeating: GridItem(), count: 5)
    
    @EnvironmentObject var courseVM: CourseViewModel
    @State private var isPresentingCourse: CourseModel? = nil


    
    var body: some View {
        
        SplashScreenView {
            
            // Home View
            
        } titleView: {
            Text("課表通")
                .font(.system(size:35).bold())
                .foregroundColor(.white)
        } logoView: {
            // make sure to give exact size of logo frame here
            // This project eg has 256*256
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 256, height: 256)
        }
            
        
        ZStack {
            Color.mint
                .ignoresSafeArea()
            VStack {
                Text("我的課表")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                                
                HStack {
                    ForEach(titles, id: \.self) { title in
                        Text(title)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        Divider()
                    }
                }
                .frame(height: 30)
                .padding()
                
                ScrollView{
                    LazyVGrid(columns: cols, spacing: 20) {
                        ForEach(courseVM.courseData) { course in
                            Button {
                                print("selected course: \(course.id)")
                                isPresentingCourse = course
                            } label: {
                                CourseView(course: course)
                            }

                        }
                        .sheet(item: $isPresentingCourse) { course in
                            EditingSheetView(course: course)
                        }
                    }
                    .padding()
                    
                }
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CourseViewModel())
    }
}


