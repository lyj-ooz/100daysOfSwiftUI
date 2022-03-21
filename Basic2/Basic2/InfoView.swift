//
//  InfoView.swift
//  Basic2
//
//  Created by YJ on 2022/03/21.
//

import SwiftUI

struct InfoView: View {
    let info: String
    let iconName: String
    
    var body: some View {
        Capsule()
            .fill(.white)
            .frame(height: 40)
            .overlay(
                HStack {
                    Image(systemName: iconName)
                        .foregroundColor( Color(red: 0.09, green: 0.63, blue: 0.52))
                    Text(info)
                        .foregroundColor(Color("InfoColor"))
                }
            )
            .padding(5)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(info: "hello", iconName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
