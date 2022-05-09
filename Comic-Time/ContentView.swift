//
//  ContentView.swift
//  Comic-Time
//
//  Created by vatran robert on 2022-05-09.
//

import SwiftUI

struct ContentView: View {
    
    @State var titleValue = String()
    @State var imageValue = String()
    @State var numberInput = 1
    
    
    var body: some View {
        HStack{
            TextField("Search number", value:$numberInput , formatter:NumberFormatter())
            Button(action: {
                fetchAPI()
            }, label: {
                Text("Get")
            })
            .padding()
        }
        ScrollView{
            Text(titleValue)
                .bold()
            AsyncImage(url: URL(string: imageValue)){ image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }.aspectRatio(contentMode: .fit)
                .frame(width:450, height: 500, alignment: .center)
            Button(action: {
                getRandom()
            }, label: {
                Text("Random")
            })
            
        }
    }
    
    func fetchAPI(){
        let url = URL(string: "https://xkcd.com/\(self.numberInput)/info.0.json")
        
        URLSession.shared.dataTask(with: url!){data, response, error in
            if let data = data {
                print("DAAT",data)
                if let decoder = try? JSONDecoder().decode(ComicStructure.self, from: data){
                    self.titleValue = decoder.title
                    self.imageValue = decoder.img
                    print("TITLE",titleValue)
                    
                }
            }
            
        }.resume()
        
    }
    
    func getRandom(){
        
        numberInput = Int.random(in: 1..<2500)
        fetchAPI()
        
    }
    
}

struct ComicStructure: Codable {
    var month : String
    var num : Int
    var link: String
    var year: String
    var news: String
    var safe_title: String
    var alt : String
    var img: String
    var title: String
    var day: String
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
