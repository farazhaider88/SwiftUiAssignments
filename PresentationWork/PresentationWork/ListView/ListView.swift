//
//  ContentView.swift
//  PresentationWork
//
//  Created by Aaban Tariq Murtaza on 16/11/2023.
//

import SwiftUI


struct ListView: View {
    
    @State var students : [Student] = []
    @State var isActive: Bool = false
    @Binding var showMenu: Bool
    @State var selectedStudent : Student?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(students) { student in
                    StudentRowView(student: student)
                        .swipeActions(edge: .leading) {
                            Button("Delete") {
                                if let index = students.firstIndex(where: { $0.name == student.name }) {
                                    students.remove(at: index)
                                }
                            }
                            .frame(width: 100)
                        }
                        .onTapGesture {
                            selectedStudent = student
                            isActive = true
                        }
                       
                }
            }
            .listStyle(.plain)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Menu") {
                        showMenu = true
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddStudentView(students: $students)) {
                        Text("Add Student")
                    }
                }
            })
            .navigationDestination(isPresented: $isActive) {
                if let selectedStudent{
                    StudentDetailView(students: $students, selectedStudent: selectedStudent)
                        .navigationTitle("Student Detail")
                        
                }
            }
            Spacer()
        }
    }
}

struct StudentRowView: View {
    let student: Student
    let padding: CGFloat = 20
    let deleteButtonWidth: CGFloat = 100
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                VStack (alignment: .leading) {
                    Text(student.name)
                    Text(student.programme)
                }
                Spacer()
                Text(student.grade)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct Student: Identifiable {
    var id = UUID()
    var name: String
    var programme: String
    var grade: String
}


#Preview {
    ListView(showMenu: .constant(false))
}
