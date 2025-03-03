# SwiftUI Login & Signup UI with Navigation

This project demonstrates a simple login and signup UI built using SwiftUI. The app allows the user to navigate between the **Login** and **Signup** screens. It provides basic validation for user inputs (Email, Password, and Username), and displays an alert upon successful login or signup.

## Features

- **Login Screen**: 
  - Email and Password fields.
  - Basic validation for empty fields.
  - Navigation to the Signup screen via a link.
  - Success alert after successful login.

- **Signup Screen**:
  - Username, Email, and Password fields.
  - Basic validation for empty fields.
  - Navigation back to the Login screen via a link.
  - Success alert after successful signup.

## SwiftUI Components Used:
- `TextField` for user inputs.
- `SecureField` for password input.
- `Button` for submitting the form.
- `Text` for labels and error messages.
- `Alert` to show the success message.
- `SwiftUI Navigation` The app utilizes NavigationView and NavigationLink to navigate between the Login and Signup screens. When the user clicks on the "Sign Up" link from the login screen, it navigates to the signup screen, and vice versa.

## How to Use:
1. Clone this repository or copy the code into your Xcode project.
2. Add the ContentView.swift file in your project.
3. Run the app in the Xcode simulator or on a physical device.
4. Fill in the Username, Email, and Password fields and click the Submit button to test the form validation.
5. If any field is empty, an error message will show up. Upon completing all fields and submitting, an alert will appear confirming the successful signup.

## Customization:
1. You can customize the colors, fonts, and layout to fit your design needs.
2. The error messages and alerts can also be modified to suit the project requirements.
