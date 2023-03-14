//
//  SwiftfulFirebaseBootcampApp.swift
//  SwiftfulFirebaseBootcamp
//
//  Created by Nick Sarno on 1/21/23.
//

import SwiftUI
import Firebase

@main
struct SwiftfulFirebaseBootcampApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
//            RootView()
//            CrashView()
//            PerformanceView()
            AnalyticsView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()

        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
}
