//
//  ChallengeEditView.swift
//  Reflection
//
//  Created by 이가은 on 2022/05/04.
//

import SwiftUI

struct ChallengeEditView: View {
    @Binding var isShow : Bool
    //    @State var team : String = ""
    //    @State var member : String = ""
    @State var goal : [MyGoal] = []
    @State var goalAdded : [MyGoal] = []
    
    @State var memberAdded : [String] = []
    
    var challengetype : String
    
    @ObservedObject var challengeViewModel : ChallengesViewModel
    
    @State var nowChallenge : Challenge
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    isShow = false
                }) {
                    Image(systemName: "xmark")
                        .font(Font.system(size: 13, weight: .semibold))
                        .foregroundColor(Color.pointGreen)
                }
                Spacer()
                Text("Reflection")
                Spacer()
                Button(action: {
                    // challenge 내용 수정
                    challengeViewModel.addMygoal(myGoals: goalAdded)
                    challengeViewModel.addMembers(key: challengetype, member: memberAdded)
                    
                    isShow = false
                }) {
                    Image(systemName: "checkmark")
                        .font(Font.system(size: 13, weight: .semibold))
                        .foregroundColor(Color.pointGreen)
                }
            }
            .foregroundColor(Color.pointGreen)
            .padding(.top, 30)
            .padding(.horizontal, 25)
            
            ScrollView(showsIndicators: false){
                
                let startDate = dataFormatingKorean(date : nowChallenge.startDate)
                let endDate = dataFormatingKorean(date : nowChallenge.endDate)
                
                Text("\(startDate) ~ \(endDate)")
                    .padding(.vertical, 30)
                    .font(.system(size: 15, weight: .regular))
                
                VStack(spacing : 0){
                    HStack{
                        Text("Team")
                            .font(.system(size: 17, weight: .semibold))
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                        TextField("", text: $nowChallenge.team)
                            .foregroundColor(Color.lightBlack)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 15)
                            .font(.system(size: 15, weight: .regular))
                    }
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(Color.pointGreen.opacity(0.44))
                        .padding(.horizontal, 10)
                    VStack(spacing : 0){
                        HStack(alignment : .center){
                            Text("Member")
                                .font(.system(size: 17, weight: .semibold))
                                .padding(.leading, 20)
                            Spacer()
                            Button(action: {
                                memberAdded.append("")
                            }) {
                                Image(systemName: "plus")
                                    .font(.system(size: 13, weight: .bold))
                                    .padding(.trailing, 25)
                                    .foregroundColor(Color.lightBlack)
                            }
                        }
                        .padding(.vertical, 15)
                        Divider()
                            .padding(.horizontal, 15)
                        VStack(spacing : 0){
                            ForEach(nowChallenge.members.indices, id : \.self){ index in
                                TextField("name", text: $nowChallenge.members[index])
                                    .foregroundColor(Color.lightBlack)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 15)
                                    .font(.system(size: 15, weight: .regular))
                            }
                            ForEach(memberAdded.indices, id : \.self){ index in
                                TextField("name", text: $memberAdded[index])
                                    .foregroundColor(Color.lightBlack)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 15)
                                    .font(.system(size: 15, weight: .regular))
                            }
                        }
                    }
                }
                .background(Color.lightGreen)
                .cornerRadius(8)
                .padding(.bottom, 25)
                
                VStack(spacing : 0){
                    HStack{
                        Text("The goal of this challenge")
                            .font(.system(size: 17, weight: .semibold))
                            .padding(.top, 5)
                        Spacer()
                        Button(action: {
                            if(goalAdded.isEmpty){
                                let maxId = challengeViewModel.mygoals.max{ a, b in
                                    a.id < b.id
                                }
                                let mygoal = MyGoal(context: "hi", isDone: false, key: challengetype, id: maxId!.id+1)
                                goalAdded.append(mygoal)
                            }else{
                                let maxId = goalAdded.max{ a, b in
                                    a.id < b.id
                                }
                                let mygoal = MyGoal(context: "hi", isDone: false, key: challengetype, id: maxId!.id+1)
                                goalAdded.append(mygoal)
                            }
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size: 13, weight: .bold))
                                .padding(.trailing, 5)
                        }
                    }
                    .foregroundColor(Color.lightBlack)
                    .padding(20)
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(Color.pointGreen.opacity(0.44))
                        .padding(.horizontal, 10)
                    
                    VStack(alignment : .leading, spacing: 0){
                        
                        ForEach(goal.indices, id : \.self){ index in
                            
                            let mygoal = goal[index]
                            
                            if(goal.count-1 != index){
                                HStack{
                                    if(mygoal.isDone){
                                        Image(systemName: "checkmark")
                                    }else{
                                        Image(systemName: "square")
                                            .foregroundColor(Color.lightGreen)
                                    }
                                    TextField(mygoal.context, text: $goal[index].context)
                                        .foregroundColor(Color.lightBlack)
                                        .padding(.vertical, 15)
                                        .font(.system(size: 15, weight: .regular))
                                        .padding(.leading, 10)
                                }
                                .padding(.leading, 20)
                                Divider()
                            }else{
                                HStack {
                                    if(mygoal.isDone){
                                        Image(systemName: "checkmark")
                                    }else{
                                        Image(systemName: "square")
                                            .foregroundColor(Color.lightGreen)
                                    }
                                    TextField(mygoal.context, text: $goal[index].context)
                                        .foregroundColor(Color.lightBlack)
                                        .padding(.top, 15)
                                        .padding(.bottom, 20)
                                        .font(.system(size: 15, weight: .regular))
                                        .padding(.leading, 10)
                                }
                                .padding(.leading, 20)
                            }
                        }
                        
                        ForEach(goalAdded.indices, id : \.self){ index in
                            
                            let mygoal = goalAdded[index]
                            
                            if(index == 0){
                                Divider()
                            }
                            
                            if(goalAdded.count-1 != index){
                                HStack{
                                    if(mygoal.isDone){
                                        Image(systemName: "checkmark")
                                    }else{
                                        Image(systemName: "square")
                                            .foregroundColor(Color.lightGreen)
                                    }
                                    TextField(mygoal.context, text: $goalAdded[index].context)
                                        .foregroundColor(Color.lightBlack)
                                        .padding(.vertical, 15)
                                        .font(.system(size: 15, weight: .regular))
                                        .padding(.leading, 10)
                                }
                                .padding(.leading, 20)
                                Divider()
                            }else{
                                HStack {
                                    if(mygoal.isDone){
                                        Image(systemName: "checkmark")
                                    }else{
                                        Image(systemName: "square")
                                            .foregroundColor(Color.lightGreen)
                                    }
                                    TextField(mygoal.context, text: $goalAdded[index].context)
                                        .foregroundColor(Color.lightBlack)
                                        .padding(.top, 15)
                                        .padding(.bottom, 20)
                                        .font(.system(size: 15, weight: .regular))
                                        .padding(.leading, 10)
                                }
                                .padding(.leading, 20)
                            }
                        }
                    }
                }
                .background(Color.lightGreen)
                .cornerRadius(8)
                Spacer()
            }
            .padding(.horizontal, 25)
            .onReceive(challengeViewModel.$mygoals, perform: { _ in
                let mygoal = challengeViewModel.mygoals.filter { mygoal in
                    mygoal.key == challengetype
                }.map { mygoal in
                    mygoal
                }
                self.goal = mygoal
            })
            .onAppear{ // 없애기
                let mygoal = challengeViewModel.mygoals.filter { mygoal in
                    mygoal.key == challengetype
                }.map { mygoal in
                    mygoal
                }
                self.goal = mygoal
            }
        }
    }
}

struct ChallengeEditView_Previews: PreviewProvider {
    @ObservedObject static var challengeViewModel : ChallengesViewModel = ChallengesViewModel()
    @State private static var isShow = false
    private static var challengetype : String = "MC1"
    
    static var previews: some View {
        ChallengeEditView(isShow: $isShow, challengetype: challengetype, challengeViewModel: challengeViewModel, nowChallenge : Challenge(key: "MC1", startDate: Date(), endDate: Date(), team: "Gamer1", members: ["Goban", "Aesop", "Marry", "Ekko"], id : 0))
    }
}
