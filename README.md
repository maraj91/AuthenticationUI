# SwiftUI Signup Page UI

This is a simple SwiftUI-based Signup Page UI created to help you understand the layout and functionality of a basic form. The user can input a `Username`, `Email`, and `Password`. If any of the fields are left empty, an error message will be shown next to the respective field. Upon successful form submission, an alert is displayed.

## Features:
- **Username Field**: Allows users to input their username with validation for empty fields.
- **Email Field**: Allows users to input their email with validation for empty fields.
- **Password Field**: Allows users to input their password with validation for empty fields.
- **Error Messages**: If the fields are left empty, error messages will prompt the user to complete the necessary fields.
- **Submit Button**: Submits the data and shows a success message if all fields are valid.
- **Alert**: After successful submission, an alert is shown confirming the signup.

## SwiftUI Components Used:
- `TextField` for user inputs.
- `SecureField` for password input.
- `Button` for submitting the form.
- `Text` for labels and error messages.
- `Alert` to show the success message.

## Preview:

```swift
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
                    .foregroundStyle(.white)
                //Username field
                Text("Username")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.white)
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
                    .foregroundStyle(.white)
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
                    .foregroundStyle(.white)
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
                        .foregroundStyle(.white)
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
            Button("Ok") {}
        } message: {
            Text("You have successfully signed up in SwiftUI! :) ")
        }

    }
}

#Preview {
    ContentView()
}
```
## How to Use:
1. Clone this repository or copy the code into your Xcode project.
2. Add the ContentView.swift file in your project.
3. Run the app in the Xcode simulator or on a physical device.
4. Fill in the Username, Email, and Password fields and click the Submit button to test the form validation.
5. If any field is empty, an error message will show up. Upon completing all fields and submitting, an alert will appear confirming the successful signup.

## Customization:
1. You can customize the colors, fonts, and layout to fit your design needs.
2. The error messages and alerts can also be modified to suit the project requirements.
