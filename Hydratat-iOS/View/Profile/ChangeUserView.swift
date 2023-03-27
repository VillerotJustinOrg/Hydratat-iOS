//
//  ChangeUserView.swift
//  Hydratat-iOS
//
//  Created by user234243 on 3/22/23.
//

import SwiftUI

struct ChangeUserView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AppViewModel
    @State private var selectedUser: User?
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 15) {
            Spacer()
            NavigationLink(destination: AddUserView()) {
                Text("New user")
            }
            List {
                ForEach(viewModel.users, id: \.self.id_user) { user in
                    Button {
                        if viewModel.compareUsers(user: user) {
                            self.presentationMode.wrappedValue.dismiss()
                        } else {
                            selectedUser = user
                            showAlert.toggle()
                        }
                    } label: {
                        HStack(spacing: 15) {
                            AvatarView(size: 40, user: user)
                            VStack(alignment: .leading, spacing: 5) {
                                Text("\(user.name)").font(.title)
                                Text("\(user.email)")
                            }.foregroundColor(.black)
                        }
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Change user to \(selectedUser?.name ?? "") ?"),
                            primaryButton: .default(Text("Yes"), action: {
                                if let u = selectedUser {
                                    saveButtonPressed(user: u)
                                }
                            }),
                            secondaryButton: .cancel(Text("No")))
                    }
                }
            }
        }
        .navigationTitle("Change user")
    }
    
    func saveButtonPressed(user: User) {
        viewModel.changeUser(user: user)
        print("\(user.name) - \(user.getQuantities().count)")
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct ChangeUserView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeUserView().environmentObject(AppViewModel())
    }
}
