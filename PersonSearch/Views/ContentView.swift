//
//  ContentView.swift
//  PersonSearch
//
//  Created by Ngân Trần on 3/16/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var fetch = FetchApi()
    @State var search = ""
    @State var allowSearch = false
    
    var body: some View {
        VStack{
        NavigationView{
        List{
            Toggle(isOn: $allowSearch) {
                Text("Filter")
                Image(systemName: "slider.horizontal.3")
            } .onReceive([self.allowSearch].publisher.first()) { (value) in
                if (allowSearch == false) {
                    self.search = ""
                }
                
           }
            if (self.allowSearch == true){
                SearchingBar(text:$search)
            }
            ForEach(fetch.users.filter({
                if !allowSearch {
                    return true
                } else {
                    if search.isEmpty {
                        return true
                    }else{
                        return $0.first_name.contains(search)
                }
                }
            }), id: \.id) { usr in
                NavigationLink(destination:UserDetail(user:usr)){
                    UserCell(user:usr)
                }
            }
        }.navigationTitle("List users")
        }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
