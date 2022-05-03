//
//  RecordView.swift
//  Reflection
//
//  Created by 이가은 on 2022/05/02.
//

import SwiftUI

struct QuestionReflectionView: View {
    @Binding var isShow : Bool
    @State private var selectedColorIndex = 0
    @State private var showDropDown : Bool = false
    
    @AppStorage("lastChallenge") var lastChallenge = "MC1"
    
    var body: some View {
        VStack{
            VStack{
                    HStack(alignment: .top){
                        if showDropDown{
                            ForEach(Challenges.challenge){challenge in
                                let challengeTitle = challenge.challengeTitle
                                if(challengeTitle != lastChallenge){
                                    Button(action: {
                                        lastChallenge = challengeTitle
                                    }) {
                                        VStack{
                                            Text(challengeTitle)
                                        }
                                        .frame(width: UIScreen.main.bounds.width / 7)
                                    }
                                    .foregroundColor(Color.lightGray)
                                }
                            }
                        }
                        VStack{
                        Text(lastChallenge)
                            Rectangle().frame(height: 2)
                                .foregroundColor(Color.pointGreen)
                        }
                        .frame(width: UIScreen.main.bounds.width / 7)
                    }
                    .onTapGesture {
                        self.showDropDown.toggle()
                    }
            }
            
            HStack{
                ForEach(AppData.questionType.indices){ index in
                    let type = AppData.questionType[index]
                    VStack{
                        Text(type)
                    }
                }
            }
            
            Picker("Favorite Color", selection: $selectedColorIndex, content: {
                Text("아이디어").tag(0)
                Text("솔루션").tag(1)
                Text("디자인").tag(2)
                Text("개발").tag(3)
            })
            .pickerStyle(SegmentedPickerStyle())
            
            Divider()
            VStack{
                ForEach(AppData.questionList[AppData.questionType[selectedColorIndex]]!.indices){ index in
                    let question = AppData.questionList[AppData.questionType[selectedColorIndex]]![index]
                    Text(question)
                }
            }
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("x"){
                    
                }
            }
        }
        .onChange(of: selectedColorIndex) { newValue in
            
        }
    }
}

struct QuestionReflectionView_Previews: PreviewProvider {
    @State private static var showQuestionReflectionView = false
    @AppStorage("lastChallenge") static var lastChallenge: String!
    
    static var previews: some View {
        QuestionReflectionView(isShow: $showQuestionReflectionView)
    }
}
