//
//  LoginFormUI.swift
//  AuthenticationUI
//
//  Created by Maraj Hussain on 03/03/25.
//

import SwiftUI

struct LoginFormUI: View {
    
    @State var email = ""
    @State var password = ""
    @State var showAlert = false
    @State var showEmailError = false
    @State var showPasswordError = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background color of the view
                Color.primaryTheme.ignoresSafeArea()
                
                VStack {
                    // Form content section for Login
                    VStack(alignment: .leading, spacing: 20) {
                        // Title for the Login form
                        Text("Login")
                            .font(.system(size: 30, weight: .heavy))
                            .foregroundStyle(.white)
                        
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
                        SecureField("Password", text: $password)
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
                        
                        // Login button
                        Button {
                            // Reset error flags
                            showEmailError = false
                            showPasswordError = false
                            
                            // Validate input fields
                            guard !email.isEmpty else {
                                showEmailError = true
                                return
                            }
                            guard !password.isEmpty else {
                                showPasswordError = true
                                return
                            }
                            
                            // Clear the fields after successful login
                            email = ""
                            password = ""
                            showAlert = true
                        } label: {
                            // Styling for the submit button
                            Text("Login")
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 48)
                        }
                        .background(.black)  // Button background color
                        .clipShape(RoundedRectangle(cornerRadius: 8))  // Rounded corners
                        .padding(.top)
                        
                        Spacer() // Add space between the form and the login button
                    }
                    .padding(.horizontal)  // Add horizontal padding to the form
                    
                    // Bottom section containing the "Don't have an account?" and signup button
                    HStack {
                        Spacer() // Pushes the text and button towards the center
                        // Button to navigate to the SignUp UI
                        NavigationLink(destination: SignUpFormUI()) {
                            HStack {
                                Text("Don't have an account?")
                                    .foregroundStyle(.white)
                                Text("Sign Up")
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.bottom, 20)
                        Spacer() // Pushes the text and button towards the center
                    }
                    .padding(.bottom, 20)  // Padding to give space from the bottom of the screen
                }
            }
        }
    }
    
}

#Preview {
    LoginFormUI()
}
