//
//  DiaryReflectionView.swift
//  Reflection
//
//  Created by 이가은 on 2022/05/02.
//

import SwiftUI

struct DiaryReflectionView: View {
    @Binding var isFullScreen : Bool
    @AppStorage("previewChallenge") var previewChallenge = "MC1"
    @State private var showDropDown : Bool = false
    
    @State private var title : String = ""
    @State private var context : String = "내용"
    
    @ObservedObject var challengeViewModel : ChallengesViewModel
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    isFullScreen = false
                }) {
                    Image(systemName: "xmark")
                        .font(Font.system(size: 13, weight: .semibold))
                        .foregroundColor(Color.pointGreen)
                }
                Spacer()
                Text("Reflection")
                Spacer()
                Button(action: {
                        let maxId = challengeViewModel.reflections.max{ a, b in
                            a.id < b.id
                        }
                        let reflection = Reflection(reflectionType: ReflectionType.Diary, date: Date(), content: [title, context], key: previewChallenge, id: maxId!.id+1)
                        
                        challengeViewModel.addReflections(reflection: reflection)
                        
                        isFullScreen = false
                }) {
                    Image(systemName: "checkmark")
                        .font(Font.system(size: 13, weight: .semibold))
                        .foregroundColor(Color.pointGreen)
                }
            }.foregroundColor(Color.pointGreen)
            VStack{
                ChallengeMenuView(showDropDown : $showDropDown)
            }
            .padding(.top, 20)
            .padding(.bottom, 20)
            
            TextField("제목", text: $title)
                .foregroundColor(Color.lightBlack)
                .padding(.bottom, 40)
                .padding(.leading, 20)
            
            TextEditor(text: $context)
                .padding(24)
                .colorMultiply(Color.lightGreen)
                .foregroundColor(self.context == "내용" ? .gray : .primary)
                .onTapGesture {
                    if self.context == "내용"{
                        self.context = ""
                    }
                }
                .font(.system(size: 15))
                .lineSpacing(10)
                .frame(height:500)
                .background(Color.lightGreen)
                .cornerRadius(20)
        }
        .padding(.horizontal, 25)
    }
}

struct DiaryReflectionView_Previews: PreviewProvider {
    @ObservedObject static var challengeViewModel : ChallengesViewModel = ChallengesViewModel()
    
    @State static var isFullScreen : Bool = false
    @AppStorage("previewChallenge") var previewChallenge = "MC1"
    
    static var previews: some View {
        DiaryReflectionView(isFullScreen : $isFullScreen, challengeViewModel: challengeViewModel)
    }
}
