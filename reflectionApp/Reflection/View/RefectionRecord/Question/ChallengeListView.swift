//
//  ChallengeListView.swift
//  Reflection
//
//  Created by 이가은 on 2022/05/03.
//

import SwiftUI

struct ChallengeListView: View {
    var body: some View {
        List{
            ForEach(Challenges.challenge){challenge in
                let challengeTitle = challenge.challengeTitle
                HStack{
                Text(challengeTitle)
                }
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct ChallengeListView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeListView()
    }
}
