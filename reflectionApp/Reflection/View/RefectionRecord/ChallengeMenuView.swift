//
//  ChallengeMenuView.swift
//  Reflection
//
//  Created by 이가은 on 2022/05/04.
//

import SwiftUI


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
                                        .foregroundColor(Color.lightOrange)
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
                            .foregroundColor(Color.lightOrange)
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                self.showDropDown.toggle()
            }
        }
    }
}
