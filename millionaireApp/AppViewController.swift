//
//  AppViewController.swift
//  millionaireApp
//
//  Created by Cavidan Mustafayev on 15.12.23.
//

import UIKit

struct DataBase{
    var qst:String?
    var asw:[String]?
}



class AppViewController: UIViewController {
    
    @IBOutlet weak var appTableView:UITableView!
    @IBOutlet weak var userDataLabel:UILabel!
    @IBOutlet weak var questionView:UIView!
    @IBOutlet weak var questionLabel:UILabel!
    @IBOutlet weak var nextButton:UIButton!
    @IBOutlet weak var checkAnswersButton:UIButton!
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        selectedQuestion += 1
        print(#function, selectedQuestion)
        appTableView.allowsSelection = true
        updateView()
    }
    
    
    
    
    
    private var user: Users?
    var selectedQuestion:Int = 0
    var selectedAnswerIndex:Int = 0
    
    fileprivate var trueAnswersIndicator:Int = 0
    fileprivate var wrongAnswersIndicator:Int = 0
    
    func setUser(_ user: Users) {
        self.user = user
    }
    
    
    
    @IBAction func checkAnswersAction(_ sender: UIButton) {
        if user == nil {
            print("this is problem")
        }
        guard let user = user else {return}
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        
        vc.setUser(user)
        vc.setCounter(trueAnswersIndicator, wrongAnswersIndicator)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    fileprivate var questions:[QuestionModel] = [
        QuestionModel(question: "Question: What is Swift", answers: [
            Answer(answer: "A) A programming language for Android"),
            Answer(answer: "B) A programming language for iOS", isTrue: true),
            Answer(answer: "C) A type of coffee"),
            Answer(answer: "D) A computer hardware brand")
        ]),
        
        QuestionModel(question: "Question: Which IDE is commonly used for iOS development?", answers: [
            Answer(answer: "A) Visual Studio"),
            Answer(answer: "B) Xcode", isTrue: true),
            Answer(answer: "C) Eclipse"),
            Answer(answer: "D) Android Studio")
        ]),
        
        QuestionModel(question: "Question: What does MVC stand for in iOS development?", answers: [
            Answer(answer: "A) Most Valuable Code"),
            Answer(answer: "B) Model View Controller", isTrue: true),
            Answer(answer: "C) Make video calls"),
            Answer(answer: "D) My very cool app")
        ]),
        
        QuestionModel(question: "Question: What is Auto Layout used for in iOS?", answers: [
            Answer(answer: "A) To automate coding tasks"),
            Answer(answer: "B) To layout user interface components", isTrue: true),
            Answer(answer: "C) To auto-generate Swift code"),
            Answer(answer: "D) To create automatic backups")
        ]),
        
        QuestionModel(question: "Question: What is a UITableViewController used for?", answers: [
            Answer(answer: "A) Managing network requests"),
            Answer(answer: "B) Handling user authentication"),
            Answer(answer: "C) Displaying tabular data", isTrue: true),
            Answer(answer: "D) Creating animations")
        ]),
        QuestionModel(question: "Question: What is Core Data used for in iOS development?", answers: [
            Answer(answer: "A) Playing audio files"),
            Answer(answer: "B) Managing persistent data", isTrue: true),
            Answer(answer: "C) Drawing graphics"),
            Answer(answer: "D) Handling network requests")
        ]),
        
        QuestionModel(question: "Question: What is the delegate pattern in Swift?", answers: [
            Answer(answer: "A) An iOS design pattern"),
            Answer(answer: "B) A way to pass data between view controllers"),
            Answer(answer: "C) A pattern to implement callbacks", isTrue: true),
            Answer(answer: "D) A method for handling asynchronous tasks")
        ]),
        
        QuestionModel(question: "Question: What does the term 'Optional' mean in Swift?", answers: [
            Answer(answer: "A) A nullable type in Swift"),
            Answer(answer: "B) An alternative way to define functions"),
            Answer(answer: "C) A keyword for declaring constants"),
            Answer(answer: "D) A type that may or may not contain a value", isTrue: true)
        ]),
        
        QuestionModel(question: "Question: What is the purpose of the 'guard' statement in Swift?", answers: [
            Answer(answer: "A) Defining constants"),
            Answer(answer: "B) Handling optional unwrapping", isTrue: true),
            Answer(answer: "C) Creating loops"),
            Answer(answer: "D) Implementing switch statements")
        ]),
        
        QuestionModel(question: "Question: In Swift, what is a closure?", answers: [
            Answer(answer: "A) A type of class"),
            Answer(answer: "B) A way to define an interface"),
            Answer(answer: "C) A self-contained block of functionality", isTrue: true),
            Answer(answer: "D) A Swift protocol")
        ])
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appTableView.dataSource = self
        appTableView.delegate = self
        
        userDataLabel.text = "\(user?.name ?? "unknown") \(user?.surname ?? "unknown")"
        questionLabel.text = questions[selectedQuestion].question
        
    }
    
    
    fileprivate func updateView(){
        questionLabel.text = questions[selectedQuestion].question
        appTableView.reloadData()
        nextButton.isHidden = true
    }
    
    
    
    fileprivate func checkAnswer(_ model: Answer){
        if model.isTrue ?? false{
            model.bgColor = .green
            trueAnswersIndicator += 1
            print("true")
        }else{
            wrongAnswersIndicator += 1
            print("false")
        }
        appTableView.reloadData()
        nextButton.isHidden = (questions.count - 1) == selectedQuestion
        ((questions.count - 1)  == selectedQuestion) ? (checkAnswersButton.isHidden = false) : (checkAnswersButton.isHidden = true)
    }
    
}


extension AppViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions[selectedQuestion].answers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "appTableViewCell", for: indexPath) as! appTableViewCell
        if let answerModel = questions[selectedQuestion].answers?[indexPath.row] {
            cell.configureCell(model: answerModel)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print((questions[selectedQuestion].answers![indexPath.row].answer) )
        let answerModel = questions[selectedQuestion].answers?[indexPath.row]
        selectedAnswerIndex = indexPath.row
        print("this is selectedAnswerIndex \(selectedAnswerIndex)")
        answerModel?.bgColor = .red
        checkAnswer(answerModel!)
        appTableView.allowsSelection = false
    }
    
}
