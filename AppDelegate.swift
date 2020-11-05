//
//  AppDelegate.swift
//  Gait
//
//  Created by Joshua Bickett on 3/11/20.
//  Copyright © 2020 Joshua Bickett. All rights reserved.
//

import UIKit
import SmartcarAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var appVersion = "2.3"
    
    // global variable in the app's AppDelegate
    var smartcar: SmartcarAuth? 

    var authenticationManager: AuthenticationManager!
    var serverManager: ServerManager!
    var tripManager: TripManager!
    var eventManager: EventManager!
    var reportManager: ReportManager!
    
    
    var locationManager: LocationManager!
    var motionManager: MotionManager!
    var updateManager: UpdateManager?
    
    
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        

//        Set the icon tint to black, on selection
        UITabBar.appearance().tintColor = .black
        
        print("AppDelegate.application()")
        
        serverManager = ServerManager()
        authenticationManager = AuthenticationManager(serverManager: serverManager)
        eventManager = EventManager(serverManager: serverManager, authenticationManager: authenticationManager)
        tripManager = TripManager(serverManager: serverManager, authenticationManager: authenticationManager)
        reportManager = ReportManager(serverManager: serverManager, authenticationManager: authenticationManager)
        locationManager = LocationManager(serverManager: serverManager, tripManager: tripManager, eventManager: eventManager)
        motionManager = MotionManager(eventManager: eventManager, locationManager: locationManager)
        updateManager = UpdateManager(locationManager: locationManager, motionManager: motionManager)
        
        if let manager = updateManager {
            manager.setLocationManagerToNotDrive()
            manager.setMotionManagerToNotDrive()
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    


}

