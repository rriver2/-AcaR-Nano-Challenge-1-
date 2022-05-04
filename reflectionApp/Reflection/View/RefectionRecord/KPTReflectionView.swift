//
//  KPTReflectionView.swift
//  Reflection
//
//  Created by 이가은 on 2022/05/02.
//

import SwiftUI

struct KPTReflectionView: View {
    @Binding var isFullScreen : Bool
    var body: some View {
        VStack{
        Text("Hello, World!")
        }
    }
}

struct KPTReflectionView_Previews: PreviewProvider {
    @State static var isFullScreen : Bool = false
    
    static var previews: some View {
        KPTReflectionView(isFullScreen: $isFullScreen)
    }
}
