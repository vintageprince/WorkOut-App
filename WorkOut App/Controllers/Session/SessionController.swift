//
//  SessionController.swift
//  WorkOut App
//
//  Created by Даниил Заканавский on 28.06.2023.
//

import UIKit

class SessionController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Hight Intensity Cardio"
        navigationController?.tabBarItem.title = Resourses.Strings.TabBar.session
        
        addNavBarButton(at: .left, with: "Pause")
        addNavBarButton(at: .right, with: "Finish")

    }
}
