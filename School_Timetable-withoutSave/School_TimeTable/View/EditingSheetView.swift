//
//  EditingSheetView.swift
//  School_TimeTable
//
//  Created by Poter Pan on 2022/8/15.
//

import SwiftUI

struct EditingSheetView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var courseVM: CourseViewModel

    
    let course:CourseModel
    
    @State private var newName : String = ""
    @State private var newPlace : String = ""
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.teal
                    .ignoresSafeArea()
                VStack{
                    Text("目前課程\(course.id)")
                    HStack {
                        Text("該節課名：")
                        TextField("", text: $newName)
                            .frame(maxWidth: .infinity, minHeight: 35)
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(10)
                            .focused($isFocused)
                    }
                    HStack {
                        Text("上課地點：")
                        TextField("", text: $newPlace)
                            .frame(maxWidth: .infinity, minHeight: 35)
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(10)
                            .focused($isFocused)
                        
                    }
                    Button("Save") {
                        print("ClickedSave")
                        courseVM.editCourse(course: course, newName: newName, newPlace: newPlace)
                        dismiss()
                    }
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(20)

                }
            }
            .navigationTitle("編輯課程")
        }
        
    }
}

struct EditingSheetView_Previews: PreviewProvider {
    static var previews: some View {
        EditingSheetView(course: CourseModel.init(name: "123", place: "123"))
            .environmentObject(CourseViewModel())

    }
}
