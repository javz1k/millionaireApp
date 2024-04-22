//
//  QuestionModel.swift
//  millionaireApp
//
//  Created by Cavidan Mustafayev on 26.12.23.
//

import Foundation
import UIKit

struct QuestionModel{
    var question:String?
    var answers:[Answer]?

}


class Answer {
    var answer:String = ""
    var bgColor:UIColor? = .white
    var isTrue:Bool? = false
    
    init(answer: String, bgColor: UIColor? = nil, isTrue: Bool? = false) {
        self.answer = answer
        self.bgColor = bgColor
        self.isTrue = isTrue
    }
    
    
}
