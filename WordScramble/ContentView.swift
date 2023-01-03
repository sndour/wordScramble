//
//  ContentView.swift
//  WordScramble
//
//  Created by Stéphane Adefemi NDOUR on 03/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord
                    )
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack{
                            Image(systemName: "\(word.count).circle.fill")
                            Text (word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit {
                addNewWord()
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        //extra validation to come

        withAnimation {
            usedWords.insert(answer, at: 0) //this line add a word to the list usedWords at element 1
            //        usedWords.append(answer) //this line add a word to the list usedWords at the end of the list
            newWord = ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
