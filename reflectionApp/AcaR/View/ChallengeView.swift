//
//  ChallengeView.swift
//  Reflection
//
//  Created by 이가은 on 2022/05/03.
//

import SwiftUI

struct ChallengeView: View {
    @Binding var isShow : Bool
    var challengetype : String
    @State var showChallengeEditView : Bool = false
    
    @ObservedObject var challengeViewModel : ChallengesViewModel
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading) {
                VStack(alignment: .leading){
                    VStack(alignment: .leading,spacing: 12){
                        let nowChallenge =  challengeViewModel.challenges.first { chalenge in
                            chalenge.key == challengetype
                        }
                        HStack{
                            Text("Date")
                                .font(.system(size: 16, weight: .bold))
                            
                            let startDate = dataFormatingKorean(date : nowChallenge!.startDate)
                            let endDate = dataFormatingKorean(date : nowChallenge!.endDate)
                            
                            Text("\(startDate) ~ \(endDate)")
                                .font(.system(size: 16, weight: .regular))
                            Spacer()
                        }
                        .padding(.top, 30)
                        HStack{
                            Text("Team")
                                .font(.system(size: 16, weight: .bold))
                            if(nowChallenge!.team == ""){
                                Text("미입력")
                                    .foregroundColor(Color.lightGray)
                                    .font(.system(size: 16, weight: .regular))
                            }else{
                                Text(nowChallenge!.team)
                                    .font(.system(size: 16, weight: .regular))
                            }
                        }
                        HStack{
                            Text("Members")
                                .font(.system(size: 16, weight: .bold))
                            if(nowChallenge!.members == []){
                                Text("미입력")
                                    .foregroundColor(Color.lightGray)
                                    .font(.system(size: 16, weight: .regular))
                            }else{
                                ForEach(nowChallenge!.members, id: \.self) { member in
                                    Text(member)
                                        .font(.system(size: 16, weight: .regular))
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading){
                        Text("My goal")
                            .font(.system(size: 20, weight: .bold))
                            .padding(.bottom, 15)
                        let thisChallegeGoal = challengeViewModel.mygoals.filter { mygoal in
                            mygoal.key == challengetype
                        }.sorted { a, b in
                            a.id < b.id
                        }
                        if(thisChallegeGoal.isEmpty){
                            HStack{
                                Text("\(challengetype)의 Goal을 입력해주세요 !")
                                    .foregroundColor(Color.lightBlack)
                                Spacer()
                            }
                            .padding()
                                .background(Color.lightGreen)
                                .cornerRadius(8)
                        }else{
                        VStack(alignment: .leading, spacing: 20, content: {
                            
                            ForEach(thisChallegeGoal, id : \.self.id){ mygoal in
                                HStack{
                                    if(mygoal.isDone){
                                        Button(action: {
                                            challengeViewModel.fixMyGoalIsDone(id: mygoal.id)
                                        }) {
                                            Image(systemName: "checkmark.square")
                                        }
                                        .foregroundColor(Color.lightBlack)
                                    }else{
                                        Button(action: {
                                            challengeViewModel.fixMyGoalIsDone(id: mygoal.id)
                                        }) {
                                            Image(systemName: "square")
                                        }
                                        .foregroundColor(Color.lightBlack)
                                    }
                                    Text(mygoal.context)
                                }
                            }
                        })
                        .animation(Animation.easeIn(duration: 0.2))
                        }
                    }
                    .padding(.top, 40)
                    .padding(.bottom, 38)
                    
                }
                .padding(.top, 25)
                .padding(.horizontal, 25)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                
                VStack(spacing : 0){
                    HStack{
                        Text("Reflection")
                            .font(.system(size: 20, weight: .semibold))
                        Spacer()
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 23)
                    
                    VStack(spacing : 25){
                        let thisChallegeReflection = challengeViewModel.reflections.filter { reflection in
                            reflection.key == challengetype
                        }.sorted { a, b in
                            a.date > b.date
                        }
                        if(thisChallegeReflection.isEmpty){
                            HStack{
                                Text("이번 챌린지의 Reflection을 입력해주세요 !")
                                    .foregroundColor(Color.lightBlack)
                                Spacer()
                            }
                            .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                        }else{
                            ForEach(thisChallegeReflection, id: \.self.id) { reflection in
                                
                                let date = dataFormating(date: reflection.date)
                                
                                HStack(alignment: .top){
                                    if(reflection.reflectionType == ReflectionType.Question){
                                        VStack{
                                            Text("🤨")
                                                .font(.system(size: 30))
                                            Text(date)
                                                .font(.system(size: 10, weight: .regular))
                                        }
                                        .padding(.trailing, 15)
                                        VStack(alignment: .leading, spacing : 0){
                                            Text("\(reflection.content[0])")
                                                .font(.system(size: 16,weight: .semibold))
                                                .padding(.bottom, 10)
                                                .padding(.leading, 5)
                                            Rectangle().frame(height: 2)
                                                .foregroundColor(Color.pointGreen.opacity(0.44))
                                                .padding(.vertical, 10)
                                            Text("\(reflection.content[1])")
                                                .font(.system(size: 15,weight: .regular))
                                                .padding(.top, 10)
                                                .padding(.leading, 5)
                                        }
                                    }else if(reflection.reflectionType == ReflectionType.Diary){
                                        VStack{
                                            Text("💭")
                                                .font(.system(size: 30))
                                            Text(date)
                                                .font(.system(size: 10, weight: .regular))
                                        }
                                        .padding(.trailing, 15)
                                        VStack(alignment: .leading, spacing : 0){
                                            Text("\(reflection.content[0])")
                                                .font(.system(size: 16,weight: .semibold))
                                                .padding(.bottom, 10)
                                                .padding(.leading, 5)
                                            Rectangle().frame(height: 2)
                                                .foregroundColor(Color.pointGreen.opacity(0.44))
                                                .padding(.vertical, 10)
                                            Text("\(reflection.content[1])")
                                                .font(.system(size: 15,weight: .regular))
                                                .padding(.top, 10)
                                                .padding(.leading, 5)
                                        }
                                    }else if(reflection.reflectionType == ReflectionType.KPT){
                                        VStack{
                                            Text("🔎")
                                                .font(.system(size: 30))
                                            Text(date)
                                                .font(.system(size: 10, weight: .regular))
                                        }
                                        .padding(.trailing, 15)
                                        VStack(alignment: .leading, spacing : 0){
                                            KPTReflectionBlock(title: "keep", content: "\(reflection.content[0])")
                                            KPTReflectionBlock(title: "Problem", content: "\(reflection.content[1])")
                                            KPTReflectionBlock(title: "Try", content: "\(reflection.content[2])")
                                        }
                                    }
                                }
                            }
                            .padding(.vertical, 25)
                            .padding(.horizontal, 25)
                            .background(Color.white)
                            .cornerRadius(8)
                        }
                    }
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 50)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .navigationTitle(challengetype)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    showChallengeEditView = true
                }) {
                    Image(systemName: "square.and.pencil")
                }
            }
        }
        .background(Color.lightGreen)
        .sheet(isPresented: $showChallengeEditView){
            
            let nowChallenge =  challengeViewModel.challenges.first { chalenge in
                chalenge.key == challengetype
            }
            
            ChallengeEditView(isShow: $showChallengeEditView, challengetype: challengetype, challengeViewModel: challengeViewModel, nowChallenge : nowChallenge!)
        }
    }
}

func KPTReflectionBlock(title : String, content : String) -> some View{
    VStack(alignment: .leading, spacing : 0){
        HStack{
            Text(title)
                .font(.system(size: 16,weight: .semibold))
                .padding(.horizontal, 10.0)
                .padding(.vertical, 3.0)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.pointGreen)
                        .opacity(0.15)
                )
                .padding(.bottom, 12)
            Spacer()
        }
        Text(content)
            .font(.system(size: 15,weight: .regular))
            .padding(.bottom, 20)
            .padding(.leading, 5)
    }
    
}

struct ChallengeView_Previews: PreviewProvider {
    @State private static var isShow = false
    private static var challengetype : String = "NC2"
    @ObservedObject static var challengeViewModel : ChallengesViewModel = ChallengesViewModel()
    
    static var previews: some View {
        ChallengeView(isShow: $isShow, challengetype : challengetype, challengeViewModel: challengeViewModel)
    }
}
