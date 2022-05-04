//
//  Model.swift
//  Reflection
//
//  Created by 이가은 on 2022/05/02.
//

import Foundation

// Enum - Associated Type
enum ReflectionType {
    case Question
    case diary
    case KPT
}

/// reflectionType이
/// 1)  Question 일 때 -> content [ question, answer ]
/// 2)  diary 일 때 -> content [ title, content ]
/// 3)  KPT 일 때 -> content [ keep, problem, try ]
/// key에는 MC1 , MC2
class Reflection{
    let reflectionType : ReflectionType
    let date : Date
    let content : [String]
    let key : String
    let id : Int
    
    init(reflectionType : ReflectionType, date: Date, content: [String], key : String, id : Int){
        self.reflectionType = reflectionType
        self.date = date
        self.content = content
        self.key = key
        self.id = id
    }
}

class MyGoal{
    let context : String
    let isDone : Bool
    let key : String
    let id : Int
    
    init(context : String, isDone: Bool, key: String , id : Int){
        self.context = context
        self.isDone = isDone
        self.key = key
        self.id = id
    }
}

func dataFormating(date : Date) -> String{
    let formatter = DateFormatter()
    formatter.dateFormat = "MM.dd(EEEEE)"
    return formatter.string(from: date)
}

/// Challenge 전체 목록
class Challenge : Identifiable{
    let key : String
    let startDate : Date
    let endDate : Date
    let team : String
    let members : [String]
    
    // id 고치기
    var id : String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter.string(from: startDate)
    }
    
    init(key : String, startDate: Date, endDate: Date , team : String, members : [String]){
        self.key = key
        self.startDate = startDate
        self.endDate = endDate
        self.team = team
        self.members = members
    }
}


class AppData{
    
    static let questionType = ["idea", "solution", "design", "develop"] // enum
    
    // struct
    static let questionList : [String : [String]] = [
        "idea" : ["1이번 프로젝트에서 가장 이루고 싶은 건 무엇인가요 ?", "오늘 활동 중에 나에게 큰 영감을 준 멤버는 누구인가요 ?", "오늘 가장 자랑스러웠던 건  (          ) 이다.", "내가 멤버들에게 나눠줄 수 있는 Skill은 무엇일까요 ?"],
        "solution" : ["오늘 활동 중에 나에게 큰 영감을 준 멤버는 누구인가요 ?", "오늘 가장 자랑스러웠던 건  (          ) 이다.", "내가 멤버들에게 나눠줄 수 있는 Skill은 무엇일까요 ?","2이번 프로젝트에서 가장 이루고 싶은 건 무엇인가요 ?"],
        "design" : ["오늘 가장 자랑스러웠던 건  (          ) 이다.","3이번 프로젝트에서 가장 이루고 싶은 건 무엇인가요 ?", "오늘 활동 중에 나에게 큰 영감을 준 멤버는 누구인가요 ?", "내가 멤버들에게 나눠줄 수 있는 Skill은 무엇일까요 ?"],
        "develop" : ["4이번 프로젝트에서 가장 이루고 싶은 건 무엇인가요 ?", "오늘 활동 중에 나에게 큰 영감을 준 멤버는 누구인가요 ?", "오늘 가장 자랑스러웠던 건  (          ) 이다.", "내가 멤버들에게 나눠줄 수 있는 Skill은 무엇일까요 ?","4이번 프로젝트에서 가장 이루고 싶은 건 무엇인가요 ?", "오늘 활동 중에 나에게 큰 영감을 준 멤버는 누구인가요 ?", "오늘 가장 자랑스러웠던 건  (          ) 이다.", "내가 멤버들에게 나눠줄 수 있는 Skill은 무엇일까요 ?","4이번 프로젝트에서 가장 이루고 싶은 건 무엇인가요 ?", "오늘 활동 중에 나에게 큰 영감을 준 멤버는 누구인가요 ?", "오늘 가장 자랑스러웠던 건  (          ) 이다.", "내가 멤버들에게 나눠줄 수 있는 Skill은 무엇일까요 ?"]
    ]
    
}
