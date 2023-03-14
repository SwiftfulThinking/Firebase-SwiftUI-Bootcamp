//
//  CrashView.swift
//  SwiftfulFirebaseBootcamp
//
//  Created by Nick Sarno on 1/24/23.
//

import SwiftUI

struct CrashView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3).ignoresSafeArea()
            
            VStack(spacing: 40) {
                
                Button("Click me 1") {
                    CrashManager.shared.addLog(message: "button_1_clicked")

                    let myString: String? = nil
                    
                    guard let myString else {
                        CrashManager.shared.sendNonFatal(error: URLError(.dataNotAllowed))
                        return
                    }
                    
                    let string2 = myString
                }
                
                Button("Click me 2") {
                    CrashManager.shared.addLog(message: "button_2_clicked")

                    fatalError("This was a fatal crash.")
                }
                
                Button("Click me 3") {
                    CrashManager.shared.addLog(message: "button_3_clicked")

                    let array: [String] = []
                    let item = array[0]
                }
            }
        }
        .onAppear {
            CrashManager.shared.setUserId(userId: "ABC123")
            CrashManager.shared.setIsPremiumValue(isPremium: false)
            CrashManager.shared.addLog(message: "crash_view_appeared")
            CrashManager.shared.addLog(message: "Crash view appeared on user's screen.")
        }
    }
}

struct CrashView_Previews: PreviewProvider {
    static var previews: some View {
        CrashView()
    }
}
