//
//  ChallengeListView.swift
//  Reflection
//
//  Created by 이가은 on 2022/05/03.
//

import SwiftUI


//struct subView View {
//    @ObservedObject var challenge : ChallengesViewModel
//
//    var body: some View {
//        VStack{
//            let reflectionCount = Challenges.reflections.filter { reflection in
//                return reflection.key == $challenge.key
//            }.count
//
//            Text(reflectionCount)
//        }
//    }
//}

struct QuestionReflectionView: View {
    @Binding var isFullScreen : Bool
    @Binding var question : String
    @State var answer : String = "answer the question"
    
    @ObservedObject var challengeViewModel : ChallengesViewModel
    
    @AppStorage("previewChallenge") var previewChallenge = "MC1"
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text(question)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 30)
            
            TextEditor(text: $answer)
                .padding(24)
                .colorMultiply(Color.lightGreen)
                .foregroundColor(self.answer == "answer the question" ? .gray : .primary)
                .onTapGesture {
                    if self.answer == "answer the question"{
                        self.answer = ""
                    }
                }
                .font(.system(size: 15))
                .lineSpacing(10)
                .frame(height:500)
                .background(Color.lightGreen)
                .cornerRadius(20)
            
        }
        .padding(.horizontal, 25)
        .navigationTitle("Reflection")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {
                    let maxId = challengeViewModel.reflections.max{ a, b in
                        a.id < b.id
                    }
                    let reflection = Reflection(reflectionType: ReflectionType.Question, date: Date(), content: [question, answer], key: previewChallenge, id: maxId!.id+1)
                    
                    challengeViewModel.addReflections(reflection: reflection)
                    
                    isFullScreen = false
                    
                }) {
                    Image(systemName: "checkmark")
                        .font(Font.system(size: 13, weight: .semibold))
                        .foregroundColor(Color.pointGreen)
                }
            }
        }
    }
}

struct QuestionReflectionView_Previews: PreviewProvider {
    @State static var question : String = "이번 프로젝트에서 가장 배우고 싶은 건 무엇인가요 ?"
    @State static var isFullScreen : Bool = true
    @ObservedObject static var challengeViewModel : ChallengesViewModel = ChallengesViewModel()
    
    static var previews: some View {
        QuestionReflectionView(isFullScreen: $isFullScreen, question: $question, challengeViewModel: challengeViewModel)
    }
}
