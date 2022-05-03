//
//  ContentView.swift
//  Reflection
//
//  Created by 이가은 on 2022/05/02.
//

import SwiftUI


//.shadow(color: Color.pointGreen.opacity(0.3), radius: 3, x: 2, y: 2)

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            MainView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
            .environmentObject(ReflectionViewModel())
    }
}
