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
    case Diary
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
    var context : String
    var isDone : Bool
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

func dataFormatingKorean(date : Date) -> String{
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy.MM.dd"
    return formatter.string(from: date)
}


/// Challenge 전체 목록
class Challenge : Identifiable{
    let key : String
    let startDate : Date
    let endDate : Date
    var team : String
    var members : [String]
    let id : Int
    
    init(key : String, startDate: Date, endDate: Date , team : String, members : [String], id : Int){
        self.key = key
        self.startDate = startDate
        self.endDate = endDate
        self.team = team
        self.members = members
        self.id = id
    }
}


class AppData{
    
    static let questionType = ["idea","design", "develop", "team"] // enum
    
    // struct
    static let questionList : [String : [String]] = [
        "idea" : [
            "이번 프로젝트에서 가장 이루고 싶은 건 무엇인가요?",
            "나는 앞으로 (          )가 기대돼요.",
            "아이디어를 발상해내면서 느꼈던 한계가 있다면, 무엇인가요?",
            "오늘 가장 인상 깊었던 질문은 무엇인가요? + 그 이유는 무엇인가요?",
            "investigation 과정에서 어려웠던 점 / 흥미로웠던 점은 무엇이었나요?",
            "우리팀이 정한 solution은 나에게 어떤 의미가 있나요?",
            "App을 정의해나가면서 어떤 어려웠던 점이 있었나요? 있었다면, 어떻게 해결했나요?",
            "자신만의 아이디어 도출 방법은 무엇인가요?",
            "오늘의 insight는 무엇인가요?",
        ],
        "design" : [
            "앱의 컨셉을 디자인에서 어떻게 녹였나요?",
            "내가 디자인에서 놓쳤던 point가 있었다면 무엇인가요?",
            "디자인에서 가장 중요한 것이 뭐라고 생각하나요?",
            "오늘 받았던 디자인 피드백은 무엇인가요?",
            "요즘 디자인에서 유행하는 패턴은 무엇인가요?",
            "디자인의 영감을 얻었던 것이 있었다면 무엇이었나요?",
            "타겟층에 어울리는 디자인을 구성하기 위해 어떤 노력을 했나요?",
        ],
        "develop" : [
            "이번 프로젝트에서 하고 싶은 개발 skill은 무엇인가요?",
            "내가 현재 고민하고 있는 기능을 위해 공부해야 하는 key word는 무엇인가요?",
            "개발 과정에서 나에게 가장 어려운 시기는 언제인가요?",
            "오늘 겪었던 issue는 무엇인가요? 그리고 issue를 해결하기 위해 어떤 노력을 했나요?",
            "나의 개발 공부 방법의 장단점은 무엇인가요?",
            "요즘 누군가에게 물어보고 싶은 개발 관련 key word는 무엇인가요?",
            "오늘의 insight는 무엇인가요?",
            "챌린지를 끝내면서 나에게 해주고 싶은 말은?",
        ],
        "team" : [
            "오늘 팀 활동에서 잘 되었던 점, 아쉬웠던 점, 배웠던 점은?",
            "오늘 활동 중에 나에게 큰 영감을 준 멤버는 누구였나요?",
            "내일 팀 활동에서는 어떤 걸 해볼 수 있을까요?",
            "우리는 어떻게 협업했나요?(우리의 협업스타일?)",
            "팀 활동에서 더 해보고 싶었던 것은?",
            "나는 우리팀에 어느만큼의 기여를 하고 있나요?",
            "오늘 활동중에 팀원들에게 본인의 의견을 전달/공유하지 못한 부분이 있었나요? 있다면 왜 그러지 못했나요?",
            "오늘 협업을 통해서 프렐루드 기간에 정했던 팀의 Norm과 Process가 잘 지켜지고 있나요?",
            "팀이 앞으로 나아가기 위해서 여러분의 생각을 바꾸거나 내려 놓은 부분이 있나요? 있다면 무엇인가요?",
            "최근 팀 활동에서 제일 좋았던 점과 아쉬웠던 점은 무엇인가요?",
        ],
    ]
    
}
