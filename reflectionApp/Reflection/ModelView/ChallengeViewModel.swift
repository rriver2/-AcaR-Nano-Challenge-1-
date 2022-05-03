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
    
    // 현재 사용자가 보고 있는 챌린지
//    @Published var currentChallenge : Challenge
//    {
//         currentChallenge가 바꼈을 때
//        didSet {
//            fixChallengeContent(currentChallenge: currentChallenge)
//        }
//    }
    
    init(){
        let challenges = Challenges.challenge
        self.challenges = challenges
//        self.currentChallenge = challenges.first!
        
//        self.fixChallengeContent(currentChallenge: challenges.first!)
    }
    
//    private func fixChallengeContent(currentChallenge : Challenge){
//        withAnimation(Animation.easeIn){
//            // 코드 작성
//        }
//    }
}
