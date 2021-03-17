//
//  UserDetail.swift
//  PersonSearch
//
//  Created by Ngân Trần on 3/16/21.
//

import SwiftUI
import KingfisherSwiftUI

struct UserDetail: View {
    var user:User
    
    var body: some View {
        VStack{
            KFImage(URL(string: user.avatar)).resizable().aspectRatio(contentMode: .fill).frame(width:250, height: 250).cornerRadius(20).padding(.bottom, 50.0)
            Text(user.first_name + " " + user.last_name)
                .font(.largeTitle)
                .fontWeight(.bold)
            Divider()
            Text("Id: " + String(user.id))
            Divider()
            Text("Email" + user.email)
            Divider()
            Spacer()
        }
    }
}

struct UserDetail_Previews: PreviewProvider {
    static var previews: some View {
        UserDetail(user: User(id: 7,email: "michael.lawson@reqres.in",first_name: "Michael",last_name: "Lawson",avatar: "https://reqres.in/img/faces/7-image.jpg"
        ))
    }
}
