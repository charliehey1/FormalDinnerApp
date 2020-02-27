//
//  students.swift
//  FormalDinnerSeating
//
//  Created by Charlie Heyman on 2/21/20.
//  Copyright © 2020 Cate. All rights reserved.
//



import Foundation

//codable struct makes list of student objects containing name, table, and waiter
struct list: Codable {
    struct student: Codable {
    var name: String
    var table: String
    var waiter: String
    }
    var students: [student]
}


