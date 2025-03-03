//
//  ContentView.swift
//  AuthenticationUI
//
//  Created by Maraj Hussain on 28/02/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var userName = ""
    @State var email = ""
    @State var password = ""
    @State var showAlert = false
    @State var showUsernameError = false
    @State var showEmailError = false
    @State var showPasswordError = false
    
    var body: some View {
        ZStack {
            Color.primaryTheme.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                // Title
                Text("Sign Up")
                    .font(.system(size: 30, weight: .heavy))
                    .foregroundStyle(Color.textField)
                //Username field
                Text("Username")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(Color.textField)
                TextField("Username", text: $userName)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.username)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                if showUsernameError {
                    Text("Username is required")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.red)
                }
                //Enail field
                Text("Email")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(Color.textField)
                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                if showEmailError {
                    Text("Email is required")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.red)
                }
                //Password field
                Text("Password")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(Color.textField)
                SecureField("Username", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.password)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                if showPasswordError {
                    Text("Password is required")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.red)
                }
                //Submit button
                Button {
                    showUsernameError = false
                    showEmailError = false
                    showPasswordError = false
                    guard !userName.isEmpty else {
                        showUsernameError = true
                        return
                    }
                    guard !email.isEmpty else {
                        showEmailError = true
                        return
                    }
                    guard !password.isEmpty else {
                        showPasswordError = true
                        return
                    }
                    userName = ""
                    email = ""
                    password = ""
                    showAlert = true
                } label: {
                    Text("Submit")
                        .foregroundStyle()
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                }
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.top)

                Spacer()
            }.padding(.horizontal)
        }
        .alert("Sign Up Success!", isPresented: $showAlert) {
            Button("Ok") {
//                showAlert = false
            }
        } message: {
            Text("You have succesfully signup in SwiftUI! :) ")
        }

    }
}

#Preview {
    ContentView()
}
