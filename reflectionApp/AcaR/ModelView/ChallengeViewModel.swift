//
//  ChallengeViewModel.swift
//  Reflection
//
//  Created by 이가은 on 2022/05/02.
//

import Foundation
import SwiftUI

class ChallengesViewModel : ObservableObject{
    
    // 모든 challenges
    @Published var challenges : [Challenge]
    
    // 모든 reflections
    @Published var reflections : [Reflection]
    
    // 모든 mygoals
    @Published var mygoals : [MyGoal]
    
    // 현재 사용자가 보고 있는 챌린지
//    @Published var currentChallenge : Challenge
//    {
//         currentChallenge가 바꼈을 때
//        didSet {
//            fixChallengeContent(currentChallenge: currentChallenge)
//        }
//    }
    
    
    func addReflections(reflection : Reflection){
        self.reflections.append(reflection)
    }
    
    func addMygoal(myGoals : [MyGoal]){
        self.mygoals += myGoals
    }
    
    func addMembers(key : String , member : [String]){
        let index = self.challenges.firstIndex { challenge in
            challenge.key == key
        }
        let copyChallenge = self.challenges[index!]
        copyChallenge.members += member
        self.challenges.remove(at: index!)
        self.challenges.insert(copyChallenge, at: index!)
    }
    
    func fixTeamName(key : String , fixTeamName : String){
        let index = self.challenges.firstIndex { challenge in
            challenge.key == key
        }
        let copyChallenge = self.challenges[index!]
        
        copyChallenge.team = fixTeamName
        
        self.challenges.remove(at: index!)
        self.challenges.insert(copyChallenge, at: index!)
    }
    
    init(){
        self.challenges = Challenges.challenges
        self.reflections = Challenges.reflections
        self.mygoals = Challenges.mygoals
        
//        self.challenges = []
//        self.reflections = []
//        self.mygoals = []
        
//        self.currentChallenge = challenges.first!
//        self.fixChallengeContent(currentChallenge: challenges.first!)
    }
    
//    private func fixChallengeContent(currentChallenge : Challenge){
//        withAnimation(Animation.easeIn){
//            // 코드 작성
//        }
//    }
    
    func fixMyGoalIsDone(id : Int){
        let index = self.mygoals.firstIndex { mygoal in
            mygoal.id == id
        }
        let copyMygoal = self.mygoals[index!]
        
        copyMygoal.isDone.toggle()
        
        self.mygoals.remove(at: index!)
        self.mygoals.append(copyMygoal)
    }
}

// 각각이 들어갈 수 있어야 함

func dateFormat(_ year : Int, _ month : Int, _ date : Int) -> Date{
    let component = DateComponents(year: year, month: month, day: date)
    let date = Calendar.current.date(from: component)!
    return date
}

// find
// appStorage로.. 해야 하는데...ㅎㅎ
// csv tsv  엑셀에서 바로 뽑을 수 있는..!
class Challenges {
    
    static let reflections : [Reflection] = [
        Reflection(reflectionType: ReflectionType.Question, date: dateFormat(2022,03,16), content: ["오늘 팀 활동에서 아쉬웠던 점은?","초반 브레인 스토밍 시간에 서로의 의견을 많이 들어보지 못했던 것 같다. 처음에 의견을 좀 더 나눴더라면 좀 더 깊이 있는 결과물이 나오지 않았을까? 하는 아쉬움이 있었다. 또, 시간 여유가 있어서 다른 조들의 발표 내용을 다 들어봤으면 좀 더 나의 사고를 확장시키고 또 다른 길로 나아갈 수 있는 기회가 생기지 않았을까하는 아쉬움이 들었다. "], key: "MC1", id: 0),
        Reflection(reflectionType: ReflectionType.Diary, date: dateFormat(2022,04,21), content: ["이번 MC1에서 놓치고 있는 것들","웹 프로젝트 할 때마다 다음번에는 좀 더 체계적이게 해야지. 좀 더 정리된 코드를 , 좀 더 체계화된 코드를 작성해야지 다짐을 했었는데 이번 프로젝트에서도 똑같이 그러고 있어서 속상했다. 시간이 쫓기면서 뭔가를 개발해나가는 게 확실히 성장을 했다는 느낌은 있지만 그 안이 촘촘히 매워지지 못했다는 생각이 많이 든다. 이번 나노 챌린지에서는 이런 점들을 메워나가는 기간이 되었으면 좋겠다."], key: "MC1", id: 1),
        Reflection(reflectionType: ReflectionType.KPT, date: dateFormat(2022,04,10), content: ["아이스 브레킹 : 어색한 분위기를 깨는데 좋은 것 같다.","이미 이야기했던 내용들을 계속 까먹는 것","이야기 나눈 내용들을 정리하면서 다음 단계로 나아가기"], key: "MC1", id: 2),
        Reflection(reflectionType: ReflectionType.Diary, date: dateFormat(2022,04,21), content: ["앱의 뿌리부터 제대로 하자.","상담 시간이 부족한게 너무너무너무 아쉬웠다. 이번 프로젝트를 하는 동안의 어려움보다는 wwdc를 피드백 받는 시간이 길어서 아쉬웠다. 이번 프로젝트가 나에게 있어서는 진짜 새로웠고 아팠고 그만큼 성장했기에 내가 제대로 된 길을 걸어가고 있는지 물어보고 싶었었는데 말이지,, 하지만 wwdc에 대해서 너무 좋은 피드백을 받았다. 사실 피드백이라기 보다는 디테일한 근거들로 많이 지적을 받았는데 그 지적이 기분 나쁘게 느껴지기 보다는 뭔가 받아야 할 지적을 받았다는 느낌과 함께 내가 헛나가기 전에 이렇게 fix받아서 다행이다라는 생각을 했다. 이야기를 들을 수록 내가 기본이 부족했구나. "], key: "MC1", id: 9),
        Reflection(reflectionType: ReflectionType.Question, date: dateFormat(2022,03,16), content: ["챌린지를 끝내면서 나에게 해주고 싶은 말은?","고생했다고 말해주고 싶다. MC1 끝나고 wwdc한다고 잠도 거의 못자고 매일을 달려오느라 고생했다고,... 말해주고 싶다. 웹 프로젝트 할 때마다 다음번에는 좀 더 체계적이게 해야지. 좀 더 정리된 코드를 , 좀 더 체계화된 코드를 작성해야지 다짐을 했었는데 이번 프로젝트에서도 똑같이 그러고 있어서 속상했다. 시간이 쫓기면서 뭔가를 개발해나가는 게 확실히 성장을 했다는 느낌은 있지만 그 안이 촘촘히 매워지지 못했다는 생각이 많이 든다. 이번 나노 챌린지에서는 이런 점들을 메워나가는 기간이 되었으면 좋겠다."], key: "MC1", id: 8),
        
        
        Reflection(reflectionType: ReflectionType.KPT, date: dateFormat(2022,04,25), content: ["저번 프로젝트에서 처럼 열정은 계속 keep하자 !","Data flow를 알지 못해서 저번 프로젝트 때 많이 헤맸었다.","이번에는 공부와 개발을 동시에 진행하지 말고 공부를 하고나서 개발을 하자."], key: "NC1", id: 3),
        
        Reflection(reflectionType: ReflectionType.Question, date: dateFormat(2022,05,01), content: [  "나의 생각을 바꾸거나 내려 놓은 부분이 있나요? 있다면 무엇인가요?","시간의 효율을 위해서 비판적으로 나의 의견을 제시하는 것을 내려놨다. 나에게 이런 조언을 누군가 해줬으면 좋겠어서 다른 사람에게도 그렇게 했었는데, 너무 직설적이고 비판적이라는 이야기를 들었다. 사람들의 프로젝트에서 좋은 점부터 이야기를 하고, 비평보다는 의견 제시 느낌으로 나의 의견을 전달하자."], key: "NC1", id: 6),
      
        Reflection(reflectionType: ReflectionType.Diary, date: dateFormat(2022,05,05), content: ["CoreData 욕심이 난다..","처음에는 백까지 하고 싶다는 생각이 없었는데 하면 할 수록 Coredata처럼 백 부분도 하고 싶다는 생각이 든다. 우선은 이번 프로젝트 잘 끝내고 MC2 시작하는 기간때 조금 여유로우니까 그때 시간을 내어 공부를 해보자."], key: "NC1", id: 5),
        
    ]
    
    static let challenges : [Challenge] = [
        Challenge(key: "MC1", startDate: dateFormat(2022,03,21), endDate: dateFormat(2022,04,22), team: "Gamer1", members: ["Goban", "Aesop", "Marry", "Ekko", "River"], id : 0),
        Challenge(key: "NC1", startDate: dateFormat(2022,04,25), endDate: dateFormat(2022,05,06), team: "", members: [], id : 1),
        Challenge(key: "MC2", startDate: dateFormat(2022,05,09), endDate: dateFormat(2022,06,24), team: "", members: [], id : 2),
        Challenge(key: "MC3", startDate: dateFormat(2022,06,27), endDate: dateFormat(2022,08,12), team: "", members: [], id : 3),
        Challenge(key: "NC2", startDate: dateFormat(2022,08,22), endDate: dateFormat(2022,09,03), team: "", members: [], id : 4),
        Challenge(key: "MacC", startDate: dateFormat(2022,09,05), endDate: dateFormat(2022,12,16), team: "", members: [], id : 5),
    ]
    
    static let mygoals : [MyGoal] = [
        MyGoal(context: "느리더라도 전략적으로 접근하기(정리해서 블로그 포스팅하기)", isDone: true, key: "MC1", id: 0),
        MyGoal(context: "우선순위 똑바로 세우기", isDone: true, key: "MC1", id: 1),
        MyGoal(context: "HIG 문서 읽기 (링고 유튭 영상도 같이)", isDone: true, key: "MC1", id: 2),
        MyGoal(context: "swift 책 완독하기", isDone: false, key: "MC1", id: 3),
        
        MyGoal(context: "Working with Data in SwiftUI 완독하기", isDone: true, key: "NC1", id: 4),
        MyGoal(context: "property wrapper 블로그 포스팅하기", isDone: true, key: "NC1", id: 5),
        MyGoal(context: "property 종류 블로그 포스팅하기", isDone: true, key: "NC1", id: 7),
        MyGoal(context: "prototype sketch로 hifi 짜기", isDone: true, key: "NC1", id: 10),
        
        MyGoal(context: "Core data 공부해서 구현하기", isDone: false, key: "MC2", id: 6),
        MyGoal(context: "반응형 UI/UX 구현하기", isDone: false, key: "MC2", id: 11),
        MyGoal(context: "app life cycle 공부하기", isDone: false, key: "MC2", id: 12),
        MyGoal(context: "HIG bar, view, control 다 읽기 (ios)", isDone: false, key: "MC2", id: 13),
        MyGoal(context: "swift 책 완독하기", isDone: false, key: "MC2", id: 14),
    ]
}
