//
//  ContentView.swift
//  Comic-Time
//
//  Created by vatran robert on 2022-05-09.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    
    var body: some View {
        HStack{
            TextField("Search number", text:$viewModel.numberInput)
            Button(action: {
                viewModel.fetchAPI()
                viewModel.numberInput = ""
            }, label: {
                Text("Get")
            })
            .padding()
        }
        ScrollView{
            Text(viewModel.titleValue)
                .bold()
            
            AsyncImage(url: URL(string: viewModel.imageValue)){ image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }.aspectRatio(contentMode: .fit)
                .frame(width:450, height: 500, alignment: .center)
            Text("Exponetion")
                .onTapGesture {
                    UIApplication.shared.open(URL(string:"https://www.explainxkcd.com/wiki/index.php/\(viewModel.number)")!)
                }
            
            
            Button(action: {
                viewModel.fetchAPIRandom()
            }, label: {
                Text("Random")
            })
            
        }
        .onAppear(perform: viewModel.fetchAPI)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


