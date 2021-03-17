//
//  AppDelegate.swift
//  MeditApption
//
//  Created by Talip Böke on 12.03.2021.
//

import UIKit

@main
internal class AppDelegate: UIResponder, UIApplicationDelegate {

    internal var window: UIWindow?
    internal var appDependencies: AppDependencies?
    internal var appCoordinator: CoordinatorProtocol?

    internal func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        let navigationController = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        let dependencies = AppDependencies()
        self.appDependencies = dependencies
        
        appCoordinator = dependencies.makeAppCoordinator(navigationController)
        appCoordinator?.start()
        return true
    }
}

