//
//  SessionController.swift
//  WorkOut App
//
//  Created by Даниил Заканавский on 28.06.2023.
//

import UIKit

class SessionController: BaseController {
    private let timerView = TimerView()
    private let statsView = WABaseInfoView()
    
    private let timerDuration = 3.0
    
    override func navBarLeftButtonHandler() {
        if timerView.state == .isStopped {
            timerView.startTimer()
        } else {
            timerView.pauseTimer()
        }
        
        timerView.state = timerView.state == .isRuning ? .isStopped : .isRuning
        addNavBarButton(
            at: .left,
            with: timerView.state == .isRuning
            ? R.Session.navBarPause : R.Strings.Session.navBarStart
        )
    }
    
    override func navBarRightButtonHandler() {
        timerView.stopTimer()
        timerView.state = .isStopped
        
        addNavBarButton(at: .left, with: R.Strings.Session.navBarStart)
    }
}

extension SessionController {
    override func addViews() {
        super.addViews()
        
        view.setupView(timerView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//            timerView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        title = R.Strings.NavBar.session
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .session)
        
        addNavBarButton(at: .left, with: R.Strings.Session.navBarStart)
        addNavBarButton(at: .right, with: R.Strings.Session.navBarFinish)
        
        timerView.configure(with: timerDuration, progress: 0)
        
    }
}
