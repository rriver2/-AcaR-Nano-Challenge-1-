//
//  RecordView.swift
//  Reflection
//
//  Created by 이가은 on 2022/05/02.
//

import SwiftUI

struct QuestionReflectionSelectView: View {
    @Binding var isFullScreen : Bool
    @State private var showDropDown : Bool = false
    @State private var reflectionType : String = "idea"
    @State private var showAnswerView : Bool = false
    
    @State private var question : String = ""
    
    @AppStorage("previewChallenge") var previewChallenge = "MC1"
    
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    ChallengeMenuView(showDropDown : $showDropDown)
                }
                .padding(.top, 20)
                .padding(.bottom, 20)
                
                ZStack(alignment: .bottom){
                    HStack(alignment: .top){
                        ForEach(AppData.questionType.indices, id : \.self){ index in
                            let type = AppData.questionType[index]
                            
                            Button(action: {
                                reflectionType = type
                            }) {
                                if(reflectionType != type){
                                    Text(type)
                                        .foregroundColor(Color.lightGray)
                                        .frame(width: UIScreen.main.bounds.width / 5)
                                }else{
                                    VStack{
                                        Text(type)
                                            .foregroundColor(Color.lightBlack)
                                            .fontWeight(.bold)
                                        Rectangle().frame(height: 2)
                                            .foregroundColor(Color.pointGreen)
                                    }
                                    .frame(width: UIScreen.main.bounds.width / 5)
                                }
                            }
                        }
                    }
                    Divider()
                }
                
                ScrollView(showsIndicators: false){
                    ForEach(AppData.questionList[reflectionType]!.indices, id : \.self){ index in
                        let question = AppData.questionList[reflectionType]![index]
                            // help 가로 전체가 안 맞춰짐
                            Button(action: {
                                showAnswerView = true
                            }) {
                                VStack(alignment: .center){
                                Text(question)
                                    .padding()
                                    .minimumScaleFactor(0.5)
                                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                                    .multilineTextAlignment(.leading)
                                    .padding(.vertical)
                                    .foregroundColor(Color.lightBlack)
                                    .background(Color.red)
                                Divider()
                                }
                            }
                    }
                }
                
                NavigationLink(destination: QuestionReflectionView(question: $question),
                               isActive: $showAnswerView) {
                }
            }
            .animation(Animation.easeInOut(duration: 0.4), value: reflectionType)
            .padding(.horizontal, 25)
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: {
                        isFullScreen = false
                    }) {
                        Image(systemName: "xmark")
                            .font(Font.system(size: 13, weight: .semibold))
                            .foregroundColor(Color.pointGreen)
                    }
                }
            }
        }
        .accentColor(Color.pointGreen)
    }
}


struct ChallengeMenuView: View{
    @Binding var showDropDown : Bool
    @AppStorage("previewChallenge") var previewChallenge = "MC1"
    
    var body: some View {
        ZStack(alignment: .bottom){
            HStack(alignment: .top){
                if showDropDown{
                    ForEach(Challenges.challenges.indices, id : \.self){index in
                        let challengeTitle = Challenges.challenges[index].key
                        Button(action: {
                            previewChallenge = challengeTitle
                        }) {
                            VStack{
                                if(challengeTitle == previewChallenge){
                                    Text(challengeTitle)
                                        .foregroundColor(Color.lightBlack)
                                        .fontWeight(.semibold)
                                    Rectangle().frame(height: 2)
                                        .foregroundColor(Color.pointGreen)
                                        .opacity(0.7)
                                }else{
                                    Text(challengeTitle)
                                        .foregroundColor(Color.lightGray)
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width / 7)
                        }
                        .foregroundColor(Color.lightGray)
                    }
                }else{
                    Spacer()
                    VStack{
                        Text(previewChallenge)
                            .foregroundColor(Color.lightBlack)
                            .fontWeight(.semibold)
                        Rectangle().frame(height: 2)
                            .foregroundColor(Color.pointGreen)
                            .opacity(0.7)
                    }
                    .frame(width: UIScreen.main.bounds.width / 7)
                }
            }
            if showDropDown{
                Divider()
            }
        }
        .animation(Animation.easeInOut(duration: 0.2), value: showDropDown)
        .onTapGesture {
            self.showDropDown.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                self.showDropDown.toggle()
            }
        }
    }
}

struct QuestionReflectionSelectView_Previews: PreviewProvider {
    @State private static var showQuestionReflectionView = false
    @AppStorage("lastChallenge") static var lastChallenge: String!
    
    static var previews: some View {
        QuestionReflectionSelectView(isFullScreen: $showQuestionReflectionView)
    }
}