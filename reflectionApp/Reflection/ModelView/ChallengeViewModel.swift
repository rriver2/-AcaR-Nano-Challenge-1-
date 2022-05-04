//
//  ChallengeViewModel.swift
//  Reflection
//
//  Created by 이가은 on 2022/05/02.
//

import Foundation
import SwiftUI

class ReflectionViewModel : ObservableObject{
    // 모든 챌린지들
    @Published var challenges : [Challenge]
    
    // 모든 reflections
    @Published var reflections : [Reflection]
    
    // 현재 사용자가 보고 있는 챌린지
//    @Published var currentChallenge : Challenge
//    {
//         currentChallenge가 바꼈을 때
//        didSet {
//            fixChallengeContent(currentChallenge: currentChallenge)
//        }
//    }
    
    init(){
        let challenges = Challenges.challenges
        self.challenges = challenges
        let reflections = Challenges.reflections
        self.reflections = reflections
//        self.currentChallenge = challenges.first!
        
//        self.fixChallengeContent(currentChallenge: challenges.first!)
    }
    
//    private func fixChallengeContent(currentChallenge : Challenge){
//        withAnimation(Animation.easeIn){
//            // 코드 작성
//        }
//    }
}

// 각각이 들어갈 수 있어야 함


// find
// appStorage로.. 해야 하는데...ㅎㅎ
// csv tsv  엑셀에서 바로 뽑을 수 있는..!
class Challenges {
    static let reflections : [Reflection] = [
        Reflection(reflectionType: ReflectionType.Question, date: Date(timeIntervalSinceNow: 1), content: ["앞으로의 과정에서 가장 걱정되는 것은 무엇인가요 ?","내가 우리 팀의 프로젝트에서 할 수 있는 게 많이 없을 거 같아서 걱정이 된다. 현업에서 하다 오신 분도 계시고, 프로젝트들을 많이 하신 거 같아서 주눅 들기도 한다."], key: "MC1", id: 0),
        Reflection(reflectionType: ReflectionType.diary, date: Date(timeIntervalSinceNow: 2), content: ["나는 왜 발표를 못할까..?","발표를 잘하고 싶다는 생각이 들어서 주말에 친구에게 자문을 구했었는데, 내가 이야기를 할 때 서론을 깔고 마지막에 본론을 이야기한다고 지적을 해주었었다. 그 말 따라 다시 생각해보니까 내가 진짜로 그런 문제가 있었고, 오늘 본론을 이야기 하고 그 본론으로의  이야기를 …"], key: "MC1", id: 1),
        Reflection(reflectionType: ReflectionType.KPT, date: Date(timeIntervalSinceNow: 3), content: ["아이스 브레이킹","이미 이야기 한 것들을 계속 까먹는 것","돌아가면서 기록 요정이 이야기 한 내용들 미로에 정리하면서 넘어가기"], key: "MC1", id: 2)
    ]
    
    static let challenges : [Challenge] = [
        Challenge(key: "MC1", startDate: Date(), endDate: Date(), team: "Gamer", members: ["goban", "aesop", "mary", "ekko"]),
        Challenge(key: "NC1", startDate: Date(), endDate: Date(), team: "Gamer", members: ["goban", "aesop", "mary", "ekko"]),
        Challenge(key: "MC2", startDate: Date(), endDate: Date(), team: "Gamer", members: ["goban", "aesop", "mary", "ekko"]),
        Challenge(key: "MC3", startDate: Date(), endDate: Date(), team: "Gamer", members: ["goban", "aesop", "mary", "ekko"]),
        Challenge(key: "NC2", startDate: Date(), endDate: Date(), team: "Gamer", members: ["goban", "aesop", "mary", "ekko"]),
        Challenge(key: "MacC", startDate: Date(), endDate: Date(), team: "Gamer", members: ["goban", "aesop", "mary", "ekko"])
    ]
    
    static let mygoal : [MyGoal] = [
        MyGoal(context: "설명할 수 있을 정도로 알고 사용하기", isDone: false, key: "MC1", id: 0),
        MyGoal(context: "느리더라도 전략적으로 접근하기", isDone: true, key: "MC1", id: 1),
        MyGoal(context: "꾸준히 공부하기 ( swift 문법, swiftUI )", isDone: false, key: "MC1", id: 2),
        MyGoal(context: "Data flow 공부하기", isDone: true, key: "MC1", id: 3),
        MyGoal(context: "Data flow 공부하기", isDone: false, key: "NC1", id: 4),
        MyGoal(context: "Data flow 공부하기", isDone: true, key: "NC1", id: 5),
        MyGoal(context: "Data flow 공부하기", isDone: false, key: "NC1", id: 6)
    ]
}
