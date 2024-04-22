//
//  ResultViewController.swift
//  millionaireApp
//
//  Created by Cavidan Mustafayev on 28.12.23.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var userDataResult1: UILabel!
    @IBOutlet weak var userScoreResult1: UILabel!
    
    private var user: Users?
    private var trueAnswerCount: Int?
    private var wrongAnswerCount: Int?

    func setUser(_ user: Users) {
        self.user = user
    }
  
    
    func setCounter(_ trueCount: Int, _ wrongCount: Int) {
        trueAnswerCount = trueCount
        wrongAnswerCount = wrongCount
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = user, let trueAnswerCount = trueAnswerCount, let wrongAnswerCount = wrongAnswerCount else {return}
        //username label
        userDataResult1.text = "Congratulations \(user.name ?? "unknown") \(user.surname ?? "unknown") you accomplish the quiz"
        
        //quiz scores
        userScoreResult1.text = "True answers \(trueAnswerCount), wrong answers \(wrongAnswerCount)"
    }
    
}
