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
class Reflection{
    let reflectionType : ReflectionType
    let date : Date
    let content : [String]
    // key 값으로 Challenge와 연결
}

class MyGoal{
    let context : String
    let isDone : Bool
    // key 값으로 Challenge와 연결, id
}

/// Challenge 전체 목록
class Challenge : Identifiable{
    let challengeTitle : String
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
}


class AppData{
    
    static let questionType = ["idea", "solution", "design", "develop"] // enum
    
    // struct
    static let questionList : [String : [String]] = [
        "idea" : ["1이번 프로젝트에서 가장 이루고 싶은 건 무엇인가요 ?", "오늘 활동 중에 나에게 큰 영감을 준 멤버는 누구인가요 ?", "오늘 가장 자랑스러웠던 건  (          ) 이다.", "내가 멤버들에게 나눠줄 수 있는 Skill은 무엇일까요 ?"],
        "solution" : ["2이번 프로젝트에서 가장 이루고 싶은 건 무엇인가요 ?", "오늘 활동 중에 나에게 큰 영감을 준 멤버는 누구인가요 ?", "오늘 가장 자랑스러웠던 건  (          ) 이다.", "내가 멤버들에게 나눠줄 수 있는 Skill은 무엇일까요 ?"],
        "design" : ["3이번 프로젝트에서 가장 이루고 싶은 건 무엇인가요 ?", "오늘 활동 중에 나에게 큰 영감을 준 멤버는 누구인가요 ?", "오늘 가장 자랑스러웠던 건  (          ) 이다.", "내가 멤버들에게 나눠줄 수 있는 Skill은 무엇일까요 ?"],
        "develop" : ["4이번 프로젝트에서 가장 이루고 싶은 건 무엇인가요 ?", "오늘 활동 중에 나에게 큰 영감을 준 멤버는 누구인가요 ?", "오늘 가장 자랑스러웠던 건  (          ) 이다.", "내가 멤버들에게 나눠줄 수 있는 Skill은 무엇일까요 ?"]
    ]
    
}


// 각각이 들어갈 수 있어야 함


// find
// appStorage로.. 해야 하는데...ㅎㅎ
// csv tsv  엑셀에서 바로 뽑을 수 있는..!
class Challenges {
    static let challenge : [Challenge] = [
        Challenge(challengeTitle: "MC1", startDate: Date(timeIntervalSinceNow: 2), endDate: Date(), team: "GAMER1", members: "goban, aesop, mary, ekko", myGoal: [MyGoal(context: "설명할 수 있을 정도로 알고 사용하기", isDone: true),MyGoal(context: "느리더라도 전략적으로 접근하기", isDone: true)], reflections: [Reflection(reflectionType: ReflectionType.KPT, date: Date(), content: ["아이스 브레이킹", "이미 이야기 한 것들을 계속 까먹는 것", "돌아가면서 기록 요정이 이야기 한 내용들 미로에 정리하면서 넘어가기"])]),
        Challenge(challengeTitle: "NC1", startDate: Date(timeIntervalSinceNow: 3), endDate: Date(), team: "GAMER2", members: "goban, aesop, mary, ekko", myGoal: [MyGoal(context: "설명할 수 있을 정도로 알고 사용하기", isDone: true),MyGoal(context: "느리더라도 전략적으로 접근하기", isDone: true)], reflections : [Reflection(reflectionType: ReflectionType.diary, date:  Date(), content: ["나는 왜 발표를 못하지..", "발표를 잘하고 싶다는 생각이 들어서 주말에 친구에게 자문을 구했었는데, 내가 이야기를 할 때 서론을 깔고 마지막에 본론을 이야기한다고 지적을 해주었었다. 그 말 따라 다시 생각해보니까 내가 진짜로 그런 문제가 있었고, 오늘 본론을 이야기 하고 그 본론으로의  이야기를 …"])]),
        Challenge(challengeTitle: "MC2", startDate: Date(timeIntervalSinceNow: 5), endDate: Date(), team: "GAMER3", members: "goban, aesop, mary, ekko", myGoal: [MyGoal(context: "설명할 수 있을 정도로 알고 사용하기", isDone: true),MyGoal(context: "느리더라도 전략적으로 접근하기", isDone: true)], reflections : [Reflection(reflectionType: ReflectionType.Question, date: Date(), content: ["이번 프로젝트에서 가장 이루고 싶은 건 무엇인가요 ?", "Data Flow를 제대로 공부해보고 싶다. 웹 프로젝트때도 그렇고 완료는 했지만 여러 잡 버그들이 있었어서 이번에는 그냥 굴러가는 것을 만드는 것이 아니라, 내가 제대로 설계하고 알고 싶다는 생각이 들었다. 혼자 해서는 모르는 것들도 많을 테니까 나와 관심분야가 비슷한 사람들과 모여서 같이 배워나가고 싶다. 그리고 효율성에 대해서 고민하는 부분들이 있을 거 같아서 메모리 구조도 제대로 공부해봐야겠다는 생각이 들었다."])]),
        Challenge(challengeTitle: "MC3", startDate: Date(timeIntervalSinceNow: 6), endDate: Date(), team: "GAMER1", members: "goban, aesop, mary, ekko", myGoal: [MyGoal(context: "설명할 수 있을 정도로 알고 사용하기", isDone: true),MyGoal(context: "느리더라도 전략적으로 접근하기", isDone: true)], reflections: [Reflection(reflectionType: ReflectionType.KPT, date: Date(), content: ["아이스 브레이킹", "이미 이야기 한 것들을 계속 까먹는 것", "돌아가면서 기록 요정이 이야기 한 내용들 미로에 정리하면서 넘어가기"])]),
        Challenge(challengeTitle: "NC2", startDate: Date(timeIntervalSinceNow: 7), endDate: Date(), team: "GAMER2", members: "goban, aesop, mary, ekko", myGoal: [MyGoal(context: "설명할 수 있을 정도로 알고 사용하기", isDone: true),MyGoal(context: "느리더라도 전략적으로 접근하기", isDone: true)], reflections : [Reflection(reflectionType: ReflectionType.diary, date:  Date(), content: ["나는 왜 발표를 못하지..", "발표를 잘하고 싶다는 생각이 들어서 주말에 친구에게 자문을 구했었는데, 내가 이야기를 할 때 서론을 깔고 마지막에 본론을 이야기한다고 지적을 해주었었다. 그 말 따라 다시 생각해보니까 내가 진짜로 그런 문제가 있었고, 오늘 본론을 이야기 하고 그 본론으로의  이야기를 …"])]),
        Challenge(challengeTitle: "MacC", startDate: Date(timeIntervalSinceNow: 8), endDate: Date(), team: "GAMER3", members: "goban, aesop, mary, ekko", myGoal: [MyGoal(context: "설명할 수 있을 정도로 알고 사용하기", isDone: true),MyGoal(context: "느리더라도 전략적으로 접근하기", isDone: true)], reflections : [Reflection(reflectionType: ReflectionType.Question, date: Date(), content: ["이번 프로젝트에서 가장 이루고 싶은 건 무엇인가요 ?", "Data Flow를 제대로 공부해보고 싶다. 웹 프로젝트때도 그렇고 완료는 했지만 여러 잡 버그들이 있었어서 이번에는 그냥 굴러가는 것을 만드는 것이 아니라, 내가 제대로 설계하고 알고 싶다는 생각이 들었다. 혼자 해서는 모르는 것들도 많을 테니까 나와 관심분야가 비슷한 사람들과 모여서 같이 배워나가고 싶다. 그리고 효율성에 대해서 고민하는 부분들이 있을 거 같아서 메모리 구조도 제대로 공부해봐야겠다는 생각이 들었다."]),Reflection(reflectionType: ReflectionType.Question, date: Date(), content: ["이번 프로젝트에서 가장 이루고 싶은 건 무엇인가요 ?", "Data Flow를 제대로 공부해보고 싶다. 웹 프로젝트때도 그렇고 완료는 했지만 여러 잡 버그들이 있었어서 이번에는 그냥 굴러가는 것을 만드는 것이 아니라, 내가 제대로 설계하고 알고 싶다는 생각이 들었다. 혼자 해서는 모르는 것들도 많을 테니까 나와 관심분야가 비슷한 사람들과 모여서 같이 배워나가고 싶다. 그리고 효율성에 대해서 고민하는 부분들이 있을 거 같아서 메모리 구조도 제대로 공부해봐야겠다는 생각이 들었다."]),Reflection(reflectionType: ReflectionType.Question, date: Date(), content: ["이번 프로젝트에서 가장 이루고 싶은 건 무엇인가요 ?", "Data Flow를 제대로 공부해보고 싶다. 웹 프로젝트때도 그렇고 완료는 했지만 여러 잡 버그들이 있었어서 이번에는 그냥 굴러가는 것을 만드는 것이 아니라, 내가 제대로 설계하고 알고 싶다는 생각이 들었다. 혼자 해서는 모르는 것들도 많을 테니까 나와 관심분야가 비슷한 사람들과 모여서 같이 배워나가고 싶다. 그리고 효율성에 대해서 고민하는 부분들이 있을 거 같아서 메모리 구조도 제대로 공부해봐야겠다는 생각이 들었다."]),Reflection(reflectionType: ReflectionType.Question, date: Date(), content: ["이번 프로젝트에서 가장 이루고 싶은 건 무엇인가요 ?", "Data Flow를 제대로 공부해보고 싶다. 웹 프로젝트때도 그렇고 완료는 했지만 여러 잡 버그들이 있었어서 이번에는 그냥 굴러가는 것을 만드는 것이 아니라, 내가 제대로 설계하고 알고 싶다는 생각이 들었다. 혼자 해서는 모르는 것들도 많을 테니까 나와 관심분야가 비슷한 사람들과 모여서 같이 배워나가고 싶다. 그리고 효율성에 대해서 고민하는 부분들이 있을 거 같아서 메모리 구조도 제대로 공부해봐야겠다는 생각이 들었다."])]),
    ]
}
