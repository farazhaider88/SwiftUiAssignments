//
//  StudentDetailView.swift
//  PresentationWork
//
//  Created by Syed Faraz Haider Zaidi on 01/01/2024.
//

import SwiftUI

struct StudentDetailView: View {
    @Binding var students: [Student]
    @State var name = ""
    @State var programme = ""
    @State var grade = ""
    @State private var oldName: String = ""
    @State private var oldProgramme: String = ""
    @State private var oldGrade: String = ""

    
    
    let selectedStudent : Student
    @State var isEditMode = false
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        VStack {
            Group {
                if isEditMode{
                    HStack {
                        Text("Student Name : ")
                        TextField("Student Name", text: $name).textFieldStyle(.roundedBorder)
                    }
                    
                    HStack{
                        Text("Student Grade : ")
                        TextField("Grade", text: $grade).textFieldStyle(.roundedBorder)
                    }
                    
                    HStack{
                        Text("Student Programme: ")
                        TextField("Programme", text: $programme).textFieldStyle(.roundedBorder)
                    }
                    
                }else{
                    HStack {
                        Text("Student Name : ")
                        Text(selectedStudent.name).bold().foregroundStyle(.red)
                    }
                    
                    HStack{
                        Text("Student Grade : ")
                        Text(selectedStudent.grade).bold().foregroundStyle(.red)
                    }
                    
                    HStack{
                        Text("Student Programme: ")
                        Text(selectedStudent.programme).bold().foregroundStyle(.red)
                    }
                   
                    
                    
                }
            }
            .padding(.all)
            
            if isEditMode{
                HStack{
                    Button(action: {
                        isEditMode = false
                        self.name = self.oldName
                        self.grade = self.oldGrade
                        self.programme = self.oldProgramme
                        
                    }, label: {
                        Text("Discard")
                       
                    }).frame(width: 100, height: 51)
                        .background(Color.secondary)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                    
                    Spacer()
                    
                    Button(action: {
                        isEditMode = false
                        updateStudent()
                        mode.wrappedValue.dismiss()
                    }, label: {
                        Text("Done")
                        
                    }).frame(width: 100, height: 51)
                        .background(Color.secondary)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                    
                }.padding(.all)
                
            }else{
                Button(action: {
                    isEditMode = true
                }, label: {
                    Text("Edit")
                }).frame(width: 235, height: 51)
                .background(Color.secondary)
                .foregroundColor(.white)
                .cornerRadius(20)
            }
        }
        .padding(.vertical)
        
        .onAppear(perform: {
            self.name = selectedStudent.name
            self.oldName = self.name
            self.grade = selectedStudent.grade
            self.oldGrade = self.grade
            self.programme = selectedStudent.programme
            self.oldProgramme = self.programme
        })
        
    }
    
    func updateStudent() {
        if let index = students.firstIndex(where: {$0.id == selectedStudent.id}){
            students[index] = Student(name: self.name, programme: self.programme, grade: self.grade)
        }
       }
}

#Preview {
    StudentDetailView(students: .constant([]), selectedStudent: Student(name: "t", programme: "a", grade: "b"))
}
