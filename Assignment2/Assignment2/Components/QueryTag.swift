//
//  QueryTag.swift
//  Assignment2
//
//  Created by Yashraj jadhav on 05/02/23.
//

import SwiftUI

struct QueryTag: View {
    var query : Query
    var isSelected : Bool
   
    var body: some View {      // if isSelected is true color will be black else gray
        Text(query.rawValue)
            .font(.caption)
            .bold()
            .foregroundColor(isSelected ? .black : .gray)
            .padding(10)
            .background(.thinMaterial)
            .cornerRadius(10)
    }
}

struct QueryTag_Previews: PreviewProvider {
    static var previews: some View {
        QueryTag(query: Query.food , isSelected: true)
    }
}
