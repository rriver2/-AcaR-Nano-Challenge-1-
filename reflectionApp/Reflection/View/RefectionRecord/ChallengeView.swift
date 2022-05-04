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
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading) {
                VStack(alignment: .leading){
                VStack(alignment: .leading,spacing: 12){
                    let nowChallenge =  Challenges.challenges.first { chalenge in
                        chalenge.key == challengetype
                    }
                    HStack{
                        Text("Date")
                            .font(.system(size: 16, weight: .bold))
                        Text(nowChallenge!.team)
                            .font(.system(size: 16, weight: .regular))
                    }
                    .padding(.top, 30)
                    HStack{
                        Text("Team")
                            .font(.system(size: 16, weight: .bold))
                        Text(nowChallenge!.team)
                            .font(.system(size: 16, weight: .regular))
                    }
                    HStack{
                        Text("Members")
                            .font(.system(size: 16, weight: .bold))
                        ForEach(nowChallenge!.members, id: \.self) { member in
                            Text(member)
                                .font(.system(size: 16, weight: .regular))
                        }
                    }
                }
                
                VStack(alignment: .leading){
                    Text("My goal")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.bottom, 15)
                    VStack(alignment: .leading, spacing: 10, content: {
                        let thisChallegeGoal = Challenges.mygoal.filter { mygoal in
                            mygoal.key == challengetype
                        }
                        ForEach(thisChallegeGoal, id : \.self.id){ mygoal in
                            HStack{
                                if(mygoal.isDone){
                                    Image(systemName: "checkmark.square")
                                }else{
                                    Image(systemName: "square")
                                }
                                Text(mygoal.context)
                            }
                        }
                    })
                }
                .padding(.top, 40)
                .padding(.bottom, 38)
                }
                .frame(maxWidth: .infinity)
                .background(Color.white)
                VStack{
                    HStack{
                        Text("Reflection")
                            .font(.system(size: 20, weight: .semibold))
                        Spacer()
                    }
                    VStack(spacing : 25){
                        let thisChallegeReflection = Challenges.reflections.filter { reflection in
                            reflection.key == challengetype
                        }
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
                                    VStack(alignment: .leading){
                                        Text("\(reflection.content[0])")
                                        Rectangle().frame(height: 2)
                                            .foregroundColor(Color.pointGreen.opacity(0.44))
                                            .padding(.vertical, 10)
                                        Text("\(reflection.content[1])")
                                    }
                                }else if(reflection.reflectionType == ReflectionType.diary){
                                    VStack{
                                        Text("💭")
                                            .font(.system(size: 30))
                                        Text(date)
                                            .font(.system(size: 10, weight: .regular))
                                    }
                                    .padding(.trailing, 15)
                                    VStack(alignment: .leading){
                                        Text("\(reflection.content[0])")
                                        Rectangle().frame(height: 2)
                                            .foregroundColor(Color.pointGreen.opacity(0.44))
                                            .padding(.vertical, 10)
                                        Text("\(reflection.content[1])")
                                    }
                                }else if(reflection.reflectionType == ReflectionType.KPT){
                                    VStack{
                                        Text("🔎")
                                            .font(.system(size: 30))
                                        Text(date)
                                            .font(.system(size: 10, weight: .regular))
                                    }
                                    .padding(.trailing, 15)
                                    VStack(alignment: .leading){
                                        Text("\(reflection.content[0])")
                                        Rectangle().frame(height: 2)
                                            .foregroundColor(Color.pointGreen.opacity(0.44))
                                            .padding(.vertical, 10)
                                        Text("\(reflection.content[1])")
                                    }
                                }
                                
                            }
                            .padding(.vertical, 25)
                            .padding(.horizontal, 25)
                            .background(Color.white)
                            .cornerRadius(8)
                        }
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 50)
                    }
                .padding(.horizontal, 25)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 32)
            }
            .navigationTitle(challengetype)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "pencil")
                }
            }
        }
        .background(Color.lightGreen)
    }
}

struct ChallengeView_Previews: PreviewProvider {
    @State private static var isShow = false
    private static var challengetype : String = "MC1"
    static var previews: some View {
        ChallengeView(isShow: $isShow, challengetype : challengetype)
    }
}
