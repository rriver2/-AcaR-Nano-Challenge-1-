//
//  ChallengeListView.swift
//  Reflection
//
//  Created by 이가은 on 2022/05/03.
//

import SwiftUI

struct QuestionReflectionView: View {

    @Binding var question : String
    @State var answer : String = "answer the question"
    
    var body: some View {
        VStack(alignment: .leading){
            
            // help 왜... 사라진거지
            Text(question)
                .font(.system(size: 20))
                .fontWeight(.bold)
            
            // help TextEditor inner padding
            
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
                    // 저장하는 코드
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
    static var previews: some View {
        QuestionReflectionView(question: $question)
    }
}
