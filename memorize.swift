//
//  ContentView.swift
//  Memorize
//
//  Created by Nicholas Conant-Hiley on 3/5/23.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["✈️", "🚂", "🚁","🚀","🚜", "🚴‍♂️", "⏰", "📈", "💥", "👁️", "🧜‍♀️", "🥷", "🧞‍♂️", "🥓", "🫒", "🧘", "🥅", "🛎️", "📘", "📭", "🪩", "⚰️", "💶","⌛️","☎️","📺","🏆"]
    @State var emojiCount = 20
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(contentMode: .fit)
                    }
                }.foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            }
            
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
                  
    var remove: some View {
       
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}


struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape =  RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
        
}













struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 14 Pro Max")
        ContentView()
            .previewDevice("iPhone 14 Pro Max")
    }
}
