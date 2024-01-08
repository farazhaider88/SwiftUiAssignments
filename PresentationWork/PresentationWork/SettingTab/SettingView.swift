//
//  SettingView.swift
//  PresentationWork
//
//  Created by Syed Faraz Haider Zaidi on 09/01/2024.
//

import SwiftUI

struct SettingView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        // Load the storyboard
        let storyboard = UIStoryboard(name: "Settings", bundle: nil)
        // Instantiate the view controller with the storyboard identifier
        let viewController = storyboard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
    return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Update the UIKit view controller if needed
    }
    
}
