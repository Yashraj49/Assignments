//
//  AddView.swift
//  Assignment1
//
//  Created by Yashraj jadhav on 05/02/23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            Form{
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Dismiss")
                }
            }
        }
        
    }
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
