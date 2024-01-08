//
//  SettingsViewController.swift
//  PresentationWork
//
//  Created by Syed Faraz Haider Zaidi on 09/01/2024.
//

import UIKit
import SwiftUI

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SettingsViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SettingTableViewCell
        cell.titleLabel.text = indexPath.row == 0 ? "View Profile" : "Switch To Tab1 root"
        cell.iconImageview.image = UIImage(systemName: indexPath.row == 0 ? "brain.head.profile" : "house.and.flag")
           return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let profileView = SwiftUIProfileView()
            navigationController?.pushViewController(UIHostingController(rootView: profileView), animated: true)
        } else if indexPath.row == 1 {
            // Switch to the first tab programmatically
            tabBarController?.selectedIndex = 0
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
