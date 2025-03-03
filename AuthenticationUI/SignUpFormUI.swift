//
//  ContentView.swift
//  AuthenticationUI
//
//  Created by Maraj Hussain on 28/02/25.
//

import SwiftUI

struct SignUpFormUI: View {
    
    @State var userName = ""
    @State var email = ""
    @State var password = ""
    @State var showAlert = false
    @State var showUsernameError = false
    @State var showEmailError = false
    @State var showPasswordError = false
    
    var body: some View {
        ZStack {
            // Background color of the view
            Color.primaryTheme.ignoresSafeArea()
            
            // Main container for the UI elements
            VStack {
                // Form content section
                VStack(alignment: .leading, spacing: 20) {
                    // Title for the Sign-Up form
                    Text("Sign Up")
                        .font(.system(size: 30, weight: .heavy))
                        .foregroundStyle(.white)
                    
                    // Username field label and input
                    Text("Username")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.white)
                    TextField("Username", text: $userName)
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.username)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    // Display error message if username is empty
                    if showUsernameError {
                        Text("Username is required")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundStyle(.red)
                    }
                    
                    // Email field label and input
                    Text("Email")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.white)
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    // Display error message if email is empty
                    if showEmailError {
                        Text("Email is required")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundStyle(.red)
                    }
                    
                    // Password field label and input
                    Text("Password")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.white)
                    SecureField("Username", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.password)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    // Display error message if password is empty
                    if showPasswordError {
                        Text("Password is required")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundStyle(.red)
                    }
                    
                    // Submit button
                    Button {
                        // Reset any error flags
                        showUsernameError = false
                        showEmailError = false
                        showPasswordError = false
                        
                        // Validate input fields
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
                        
                        // Clear the fields after a successful sign up
                        userName = ""
                        email = ""
                        password = ""
                        showAlert = true
                    } label: {
                        // Styling for the submit button
                        Text("Submit")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                    }
                    .background(.black)  // Button background color
                    .clipShape(RoundedRectangle(cornerRadius: 8))  // Rounded corners
                    .padding(.top)
                    
                    Spacer() // Add space between the form and login button
                }
                .padding(.horizontal)  // Add horizontal padding to the form
                
                // Bottom section containing the "Already Have an account?" and login button
                HStack {
                    Spacer() // Pushes the text and button towards the center
                    Text("Already Have an account?")
                        .foregroundStyle(.white)
                    // Login button with a blue color
                    Button("LOGIN") {
                        // Handle login action here
                    }
                    .foregroundColor(.blue) // Button text color
                    Spacer() // Pushes the text and button towards the center
                }
                .padding(.bottom, 20)  // Padding to give space from the bottom of the screen
            }
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
    SignUpFormUI()
}
