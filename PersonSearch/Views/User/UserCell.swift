//
//  UserCell.swift
//  PersonSearch
//
//  Created by Ngân Trần on 3/16/21.
//

import SwiftUI
import KingfisherSwiftUI

struct UserCell: View {
    var user: User
    var body: some View {
       HStack {
        KFImage(URL(string: user.avatar)).resizable().aspectRatio(contentMode: .fill).frame(width:130, height: 130).cornerRadius(20)
        Text(user.first_name)
            .font(.largeTitle).padding(.leading)
       }.padding(.all)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(user: User(id: 7,email: "michael.lawson@reqres.in",first_name: "Michael",last_name: "Lawson",avatar: "https://reqres.in/img/faces/7-image.jpg"
        ))
    }
}
