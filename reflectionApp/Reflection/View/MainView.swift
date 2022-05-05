//
//  ContentView.swift
//  Reflection
//
//  Created by 이가은 on 2022/04/29.
//

import SwiftUI


struct MainView: View {
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    @StateObject var challengeViewModel : ChallengesViewModel = ChallengesViewModel()
    
    @State private var showActionSheet = false
    @State private var showQuestionReflectionView = false
    @State private var showDiaryReflectionView = false
    @State private var showKPTReflectionView = false
    
    @State private var showChallengeView = false
    @State private var challengeType : String = "MC1"
    
    var body: some View {
        NavigationView{
            VStack(spacing : 0){
                topContent
                
                LazyVGrid(columns: columns) {
                    ForEach(challengeViewModel.challenges.indices, id: \.self){ index in
                        
                        let challenge = challengeViewModel.challenges[index]
                        
                        let reflectionCount = challengeViewModel.reflections.filter { reflection in
                            return reflection.key == challenge.key
                        }.count
                        
                        Button(action: {
                            showChallengeView = true
                            challengeType = challenge.key
                        }) {
                            ZStack{
                                Circle()
                                    .strokeBorder(Color.pointGreen)
                                    .frame(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.width/4)
                                Text(challenge.key)
                                    .font(.system(size: 25))
                                    .fontWeight(.regular)
                            }
                            .foregroundColor(Color.lightBlack)
                        }
                        .padding(.bottom)
                        .overlay(alignment: .topLeading) {
                            
                            if(Int(reflectionCount) > 0){
                                ZStack{
                                    Circle()
                                        .foregroundColor(Color.white)
                                        .frame(width: 30, height: 30)
                                    Text("\(reflectionCount)")
                                        .fontWeight(.semibold)
                                        .font(.system(size: 15))
                                        .foregroundColor(Color.pointGreen)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
                
                NavigationLink(destination: ChallengeView(isShow : $showChallengeView, challengetype: challengeType, challengeViewModel: challengeViewModel),
                               isActive: $showChallengeView) {
                }
            }
            .navigationBarItems(trailing: Button(action : {
                showActionSheet = true
            }){
                Image(systemName: "plus")
                    .foregroundColor(Color.white)
                    .font(.system(size: 20))
            })
            .confirmationDialog("회고 형식을 골라주세요 :) ", isPresented: $showActionSheet, titleVisibility: .visible) {
                Button(action: {
                    showQuestionReflectionView = true
                }) {
                    Text("질문")
                }
                Button(action: {
                    showDiaryReflectionView = true
                }) {
                    Text("일기")
                }
                Button(action: {
                    showKPTReflectionView = true
                }) {
                    Text("KPT")
                }
            }
        }
        .fullScreenCover(isPresented: $showQuestionReflectionView) {
            QuestionReflectionSelectView(isFullScreen: $showQuestionReflectionView, challengeViewModel: challengeViewModel)
        }
        .fullScreenCover(isPresented: $showDiaryReflectionView) {
            DiaryReflectionView(isFullScreen: $showDiaryReflectionView, challengeViewModel : challengeViewModel)
        }
        .fullScreenCover(isPresented: $showKPTReflectionView) {
            KPTReflectionView(isFullScreen: $showKPTReflectionView, challengeViewModel : challengeViewModel)
        }
        .accentColor(Color.pointGreen)
    }
}

extension MainView {
    private var topContent : some View{
        ZStack{
            Ellipse()
                .frame(width: UIScreen.main.bounds.width + 200, height: 300, alignment: .center)
                .foregroundColor(Color.mainGreen)
                .offset(x: 0, y: -250)
            VStack{
                Text("🌱")
                    .rotationEffect(Angle(degrees: 180))
                    .font(.system(size: 50))
                    .offset(x: 0, y: -45)
                Text("\" 아는 만큼 보인다 \n   보이는 게 힘이다 ! \"")
                    .font(.system(size: 25))
                    .fontWeight(.regular)
                    .lineSpacing(10)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
