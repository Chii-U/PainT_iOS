//
//  PainTApp.swift
//  PainT
//
//  Created by 최승희 on 4/26/24.
//

import SwiftUI
import SwiftData
import GoogleSignInSwift

@main
struct PainTApp: App {
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            let userDefaults = UserDefaultsService()
            if(userDefaults.getAccessToken() != nil) {
                tabSwiftUIView()
            } else {
                loginSwiftUIView() // 처음 시작 뷰
            }
        }
        .modelContainer(sharedModelContainer)
    }
}

extension UINavigationController: ObservableObject, UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
