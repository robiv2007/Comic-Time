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
        VStack{
            
            HStack{
                Image(systemName: "magnifyingglass")
                TextField("Search comic nr", text:$viewModel.numberInput)
                    .font(.title3)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20)
                        .fill(Color.init(red: 87 / 255, green: 178 / 255, blue: 250 / 255)))
                    .foregroundColor(.black)
                
                Button(action: {
                    viewModel.fetchAPI()
                    viewModel.numberInput = ""
                }, label: {
                    Text("Search")
                        .font(.title3)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    
                })
                
            }
            ScrollView{
                Text(viewModel.comicTitle)
                    .font(.title)
                    .bold()
                
                HStack(spacing: 20){
                    Text("Comic nr: \(viewModel.comicNumber)")
                        .font(.title3)
                        .bold()
                    
                    Link("Explanation",destination: URL(string: "https://www.explainxkcd.com/wiki/index.php/\(viewModel.comicNumber)")!)
                        .foregroundColor(.red)
                        .font(.title3)
                        .padding(5)
                        .border(Color.red, width: 3)
                    
                }
                .padding()
                
                AsyncImage(url: URL(string: viewModel.comicImage)){ image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }.aspectRatio(contentMode: .fit)
                    .frame(width:400, height: 400, alignment: .center)
                Text(viewModel.comicContent)
                    .font(.title3)
                    .bold()
                    .padding()
                
            }
            Button(action: {
                viewModel.fetchAPIRandom()
            }, label: {
                Text("Random")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            })
            .padding()
            .onAppear(perform: viewModel.fetchAPI)
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


