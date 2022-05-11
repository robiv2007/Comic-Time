//
//  WelcomeView.swift
//  Comic-Time
//
//  Created by vatran robert on 2022-05-10.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        
        NavigationView{
            ZStack{
                Color.blue
                    .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Text("Comic Time")
                    .font(.system(size: 50, design: .rounded))
                    .bold()
                    .foregroundColor(Color.white)
                   
                Spacer()
                
                
                NavigationLink(destination: ContentView())
                {
                    Text("Get In")
                        .frame(width: 120, height: 120)
                        .font(.title)
                        .foregroundColor(Color.white)
                        .background(Color.red)
                        .clipShape(Circle())
                    
                }
                Spacer()
            }
            
          }
            
       }
        
    }
    
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
