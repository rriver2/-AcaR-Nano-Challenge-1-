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
    @State private var context : String = ""
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    isFullScreen = false
                }) {
                    Image(systemName: "xmark")
                        .font(Font.system(size: 13, weight: .semibold))
                        .foregroundColor(.black)
                }
                Spacer()
                Text("Reflection")
                Spacer()
                Button(action: {
                    // 저장하는 코드
                }) {
                    Image(systemName: "checkmark")
                        .font(Font.system(size: 13, weight: .semibold))
                        .foregroundColor(.black)
                }
            }
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
                .foregroundColor(Color.lightBlack)
                .font(.system(size: 15))
                .lineSpacing(10)
                .frame(height:500)
                .cornerRadius(20)
                .colorMultiply(Color.lightGreen)
        }
        .padding(.horizontal, 25)
    }
}

struct DiaryReflectionView_Previews: PreviewProvider {
    
    @State static var isFullScreen : Bool = false
    @AppStorage("previewChallenge") var previewChallenge = "MC1"
    
    static var previews: some View {
        DiaryReflectionView(isFullScreen : $isFullScreen)
    }
}
