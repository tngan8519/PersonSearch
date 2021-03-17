//
//  SearchingBar.swift
//  PersonSearch
//
//  Created by Ngân Trần on 3/17/21.
//

import SwiftUI

struct SearchingBar: View {
    @Binding var text:String
    @State var cancel = false
    
    var body: some View {
        HStack{
            HStack{
                Image(systemName: "magnifyingglass").font(.system(size: 30)).foregroundColor(.gray)
                TextField("Search by first name", text: $text).onChange(of: text, perform: { value in
                    if (value != ""){
                        self.cancel = true
                    }
                })
            }
            if (self.text != "" && self.cancel == true){
                Button(action: {
                    self.cancel = false
                    self.text = ""
                }){
                    Image(systemName: "clear").font(.system(size: 30)).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
            }
        }.padding(.all).background(
            Color.black.opacity(0.2)
        )
    }
}



