//
//  ViewModel.swift
//  Comic-Time
//
//  Created by vatran robert on 2022-05-09.
//

import Foundation
import SwiftUI

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

class ViewModel: ObservableObject{
    
    @Published var titleValue = String()
    @Published var imageValue = String()
    @Published var numberInput = String()
    @Published var number = Int()

    func fetchAPI(){
        guard let url = URL(string: "https://xkcd.com/\(numberInput)/info.0.json") else {
            return
        }
        
        URLSession.shared.dataTask(with: url){data, _, error in
            if let data = data {
                print("DATA",data)
                if let decoder = try? JSONDecoder().decode(ComicStructure.self, from: data){
                    
                    DispatchQueue.main.async {
                    self.titleValue = decoder.title
                    self.imageValue = decoder.img
                    
                    print("TITLE",self.titleValue)
                    print("IMAGE",self.imageValue)
                       
                    }
                }
            }
            
        }.resume()
        
    }
    
    
    func fetchAPIRandom(){
        let randomNumber = Int.random(in: 1..<2500)
        guard let url = URL(string: "https://xkcd.com/\(randomNumber)/info.0.json") else {
            return
        }
        
        URLSession.shared.dataTask(with: url){data, _, error in
            if let data = data {
                print("DATA",data)
                if let decoder = try? JSONDecoder().decode(ComicStructure.self, from: data){
                    
                    DispatchQueue.main.async {
                    self.titleValue = decoder.title
                    self.imageValue = decoder.img
                    self.number = decoder.num
                    
                    print("TITLE",self.titleValue)
                    print("IMAGE",self.imageValue)
                       
                    }
                }
            }
            
        }.resume()
        
    }
    
}

