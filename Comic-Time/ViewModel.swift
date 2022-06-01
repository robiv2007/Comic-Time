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
    
    @Published var comicTitle = String()
    @Published var comicImage = String()
    @Published var numberInput = String()
    @Published var comicNumber = Int()
    @Published var comicContent = String()
    private var currentComicNumber = Int()
    
    func fetchAPI(){
        //url based on the input number
        guard let url = URL(string: "https://xkcd.com/\(numberInput)/info.0.json") else {
            return
        }
        //get the api data and save it in different variables
        URLSession.shared.dataTask(with: url){data, _, error in
            if let data = data {
                print("DATA",data)
                if let decoder = try? JSONDecoder().decode(ComicStructure.self, from: data){
                    
                    DispatchQueue.main.async {
                        self.comicTitle = decoder.title
                        self.comicImage = decoder.img
                        self.comicNumber = decoder.num
                        self.currentComicNumber = decoder.num
                        self.comicContent = decoder.alt
                        
                        
                        print("TITLE",self.comicTitle)
                        print("IMAGE",self.comicImage)
                        
                    }
                }
            }
            
        }.resume()
        
    }
    
    
    func fetchAPIRandom(){
        // get the data with a random between comic number one and currentNumber
        let randomNumber = Int.random(in: 1..<currentComicNumber)
        guard let url = URL(string: "https://xkcd.com/\(randomNumber)/info.0.json") else {
            return
        }
        
        URLSession.shared.dataTask(with: url){data, _, error in
            if let data = data {
                print("DATA",data)
                //decoding the JSON data based on the api structure
                if let decoder = try? JSONDecoder().decode(ComicStructure.self, from: data){
                    
                    DispatchQueue.main.async {
                        self.comicTitle = decoder.title
                        self.comicImage = decoder.img
                        self.comicNumber = decoder.num
                        self.comicContent = decoder.alt
                        
                        print("TITLE",self.comicTitle)
                        print("IMAGE",self.comicImage)
                        
                    }
                }
            }
            
        }.resume()
        
    }
    
}

