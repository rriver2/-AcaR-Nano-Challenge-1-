//
//  KPTReflectionView.swift
//  Reflection
//
//  Created by 이가은 on 2022/05/02.
//

import SwiftUI

struct KPTReflectionView: View {
    @Binding var isFullScreen : Bool
    @AppStorage("previewChallenge") var previewChallenge = "MC1"
    @State private var showDropDown : Bool = false
    @ObservedObject var challengeViewModel : ChallengesViewModel
    
    @State private var keepContent : String = ""
    @State private var problemContent : String = ""
    @State private var tryContent : String = ""
    
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
                    let reflection = Reflection(reflectionType: ReflectionType.KPT, date: Date(), content: [keepContent, problemContent, tryContent], key: previewChallenge, id: maxId!.id+1)
                            
                            challengeViewModel.addReflections(reflection: reflection)
                            
                            isFullScreen = false
                }) {
                    Image(systemName: "checkmark")
                        .font(Font.system(size: 13, weight: .semibold))
                        .foregroundColor(Color.pointGreen)
                }
            }.foregroundColor(Color.pointGreen)
            
            ScrollView(showsIndicators: false){
                VStack{
                    ChallengeMenuView(showDropDown : $showDropDown)
                }
                .padding(.top, 20)
                VStack(alignment: .leading){
                    Text("Keep")
                        .font(.system(size: 25, weight: .bold))
                        .padding(.top, 27)
                        .padding(.bottom, 3)
                    Text("잘하고 있는 점, 계속 했으면 좋겠는 점")
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.bottom, 10)
                    
                    TextEditor(text: $keepContent)
                        .padding(24)
                        .colorMultiply(Color.lightGreen)
                        .foregroundColor(Color.lightBlack)
                        .font(.system(size: 15))
                        .lineSpacing(10)
                        .frame(height:150)
                        .background(Color.lightGreen)
                        .cornerRadius(20)
                }
                VStack(alignment: .leading){
                    Text("Problem")
                        .font(.system(size: 25, weight: .bold))
                        .padding(.top, 45)
                        .padding(.bottom, 3)
                    Text("변화가 필요한 점, 문제점")
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.bottom, 10)
                    
                    TextEditor(text: $problemContent)
                        .padding(24)
                        .colorMultiply(Color.lightGreen)
                        .foregroundColor(Color.lightBlack)
                        .font(.system(size: 15))
                        .lineSpacing(10)
                        .frame(height:150)
                        .background(Color.lightGreen)
                        .cornerRadius(20)
                }
                VStack(alignment: .leading){
                    Text("Try")
                        .font(.system(size: 25, weight: .bold))
                        .padding(.top, 45)
                        .padding(.bottom, 3)
                    Text("앞으로를 위한 문제 개선, 도전해보고 싶은 일들")
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.bottom, 10)
                    
                    TextEditor(text: $tryContent)
                        .padding(24)
                        .colorMultiply(Color.lightGreen)
                        .foregroundColor(Color.lightBlack)
                        .font(.system(size: 15))
                        .lineSpacing(10)
                        .frame(height:150)
                        .background(Color.lightGreen)
                        .cornerRadius(20)
                }
            }
        }
        .padding(.horizontal, 25)
    }
}

struct KPTReflectionView_Previews: PreviewProvider {
    @State static var isFullScreen : Bool = false
    @AppStorage("previewChallenge") var previewChallenge = "MC1"
    @ObservedObject static var challengeViewModel : ChallengesViewModel = ChallengesViewModel()
    
    static var previews: some View {
        KPTReflectionView(isFullScreen: $isFullScreen , challengeViewModel: challengeViewModel)
    }
}
