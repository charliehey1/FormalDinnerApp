//
//  ContentView.swift
//  Formal Dinner2
//
//  Created by Simon Burke on 2/25/20.
//  Copyright © 2020 Simon Burke. All rights reserved.
//

import SwiftUI

let request = Request()

struct ContentView: View {
    @State var search:String = ""
    @State var tableNum = ""
    @State var members = []
    @State var memberString:String = ""
    @State var tableString = ""
    @State var seating = list(students: [list.student(name: "bill", table: "1", waiter: "No")])
    var body: some View {
        VStack {
            HStack {
                TextField("  Enter Your Name", text: $search, onEditingChanged: {_ in
                    self.getTable()
                    self.findTable(name: self.search)
                    self.memberToString(table: self.members as! [String])
                    
                })
                    .background(Color.white)
                    .foregroundColor(.black)
                    .font(.system(size: 25))
                    .cornerRadius(25)
                    .padding(.leading, 10)
                    .padding(.top, 30)
                    .padding(.trailing, 20)
                Button(action: {
                }) {
                    Text("")
                }
                .background(Image(systemName: "magnifyingglass")
                .padding(.trailing, 30))
                .padding(.top, 30)
                
                
                
            }
            Text(tableString)
                .font(.system(size: 30))
                .padding(.bottom, 30)
            Text(memberString)
                .font(.system(size: 30))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
        .edgesIgnoringSafeArea(.all)
    }
    func getTable() {
        request.getStudents {  [] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let students):
                self.seating = students
                //sets seating equal to list of students, their table numbers, and whether or not they are waiters
                
            }
        }
    }
    
    //Find table for searched name
    func findTable(name: String) {
        //search through list for searched name
        for i in 0...seating.students.count-1 {
            if seating.students[i].name == search {
                self.tableNum = seating.students[i].table
            }
        }
        members = []
        //find all students who share same table number
        for i in 0...seating.students.count-1 {
            if seating.students[i].table == self.tableNum {
                if seating.students[i].waiter == "Yes" {
                    seating.students[i].name.append(" (W)")
                }
                self.members.append(seating.students[i].name)
            }
        }
    }
    //convert list of table members to string
    func memberToString(table: [String]) {
        //all all students to string on new line
        var str = "Table Members:"
        for student in table {
            str.append("\n " + student)
        }
        if tableNum != "" {
            memberString = str
            tableString = ("Table Number: \n" + tableNum)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

    func searchList(search: String) {
        
}
