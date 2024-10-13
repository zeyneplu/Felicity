//
//  ContentView.swift

//  felicity
//
//  Created by Dustinne Gutierrez on 9/17/24.
//

import SwiftUI

struct ContentView: View
{
    // State variables for the email and password input
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn = false
    @State private var showAlert = false
    let deviceBg = #colorLiteral(red: 0.9812142253, green: 0.8412673473, blue: 0.8124522567, alpha: 1)
    var body: some View {
        ZStack{
            Color(deviceBg).ignoresSafeArea()
            VStack {
                
                Spacer()
                // App title or Logo placeholder
                Text("Add logo here!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 90)
                
                // Email text field
                TextField("user", text: $email)
                    .fontWeight(.thin)
                    .frame(width: 70)
                    .padding(.leading, 30)
                    .padding(10)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(20)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                
                // Password text field
                SecureField("pass", text: $password)
                    .fontWeight(.thin)
                    .frame(width: 70)
                    .padding(.leading, 30)
                    .padding(10)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(20)
                
                // Login button
                Button(action: {
                    // Handle login action here
                    if email.isEmpty || password.isEmpty {
                        showAlert = true
                    } else {
                        isLoggedIn = true
                    }
                }) {
                    Text("Log In")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text("Please fill in all fields"), dismissButton: .default(Text("OK")))
                }
                
                // Navigation to home screen or dashboard upon login
                if isLoggedIn {
                    Text("Welcome, you are now logged in!")
                        .padding()
                }
                
                Spacer()
            }
            .padding()
        }
    }
}
struct ContentView_Previews:
                                PreviewProvider {
    static var previews: some View{
        ContentView()

    }
}
                                
                                
                                

#Preview {
    ContentView()
}
