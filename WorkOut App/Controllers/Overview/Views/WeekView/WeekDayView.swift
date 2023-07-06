//
//  WeekDayView.swift
//  WorkOut App
//
//  Created by Виктория Заканавская on 06.07.2023.
//

import UIKit

extension WeekView {
    final class WeekDayView: BaseView {
        
        private let nameLabel = UILabel()
        private let dateLabel = UILabel()
        private let stackView = UIStackView()
        
        func configure(with index: Int, and name: String) {
            let startOfWeek = Date().startOfWeek
            let currentDay = startOfWeek.agoForward(to: index)
            let day = Calendar.current.component(.day, from: currentDay)
            
            let isToday = currentDay.stripTime() == Date().stripTime()
            
            backgroundColor = isToday ? Resourses.Colors.active : Resourses.Colors.background
            
            nameLabel.text = name.uppercased()
            nameLabel.textColor = isToday ? .white : Resourses.Colors.inactive
            
            dateLabel.text = "\(day)"
            dateLabel.textColor = isToday ? .white : Resourses.Colors.inactive
        }
    }
}

extension WeekView.WeekDayView {
    override func addViews() {
        super.addViews()

        addView(stackView)
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)

    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    override func configureViews() {
        super.configureViews()
                
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        nameLabel.font = Resourses.Fonts.helveticaRegular(with: 9)
        nameLabel.textAlignment = .center
        
        dateLabel.font = Resourses.Fonts.helveticaRegular(with: 15)
        dateLabel.textAlignment = .center

        stackView.spacing = 3
        stackView.axis = .vertical
    }
}
