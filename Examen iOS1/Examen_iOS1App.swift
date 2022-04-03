//
//  Examen_iOS1App.swift
//  Examen iOS1
//
//  Created by Macbook air Aeron505 on 18/03/22.
//

import SwiftUI      
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?)  -> Bool {
        FirebaseApp.configure()
   
    return true
   }
}
    
@main
struct Examen_iOS1App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self)var delegate
    
    var body: some Scene {
        WindowGroup {
            ListView()
        }
    }
}
  
