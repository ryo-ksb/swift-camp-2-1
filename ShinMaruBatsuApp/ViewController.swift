//
//  ViewController.swift
//  ShinMaruBatsuApp
//
//  Created by 小芝亮太 on 2018/10/28.
//  Copyright © 2018 小芝亮太. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentQuestionNum: Int = 0
    
    var queAnsRe: [[String: Any]] = []
    
    @IBOutlet weak var questionTextField: UITextView!
    
    @IBAction func toButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "queAns") == nil {
            UserDefaults.standard.set([], forKey: "queAns")
        }
        
        showQuestion()
        
    }
    
    /// Storyboadでunwind sequeを引くために必要
    @IBAction func unwindToFirstView(segue: UIStoryboardSegue) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
 
        showQuestion()
        
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    func showQuestion() {
        
        queAnsRe = UserDefaults.standard.object(forKey: "queAns") as! [[String : Any]]
        
        if queAnsRe.count > currentQuestionNum {
        
            let queAnsDic = queAnsRe[currentQuestionNum]
        
            if let que = queAnsDic["question"] as? String {
           
                questionTextField.text = que
                
            }
            
        } else {
            
                questionTextField.text = "問題がありません、問題を作りましょう！"
            
        }
    }
    
    func checkAnswer(yourAnswer: Bool) {
        
        queAnsRe = UserDefaults.standard.object(forKey: "queAns") as! [[String : Any]]
        
        if queAnsRe.count > currentQuestionNum {
        
            let queAnsDic = queAnsRe[currentQuestionNum]
        
            if let ans = queAnsDic["answer"] as? Bool {
            
                if yourAnswer == ans {
                
                    currentQuestionNum += 1
                
                    showAlert(message: "正解")
                
                } else {
                
                    showAlert(message: "不正解")
                
                }
            }
        
            if currentQuestionNum >= queAnsRe.count {
                currentQuestionNum = 0
            }
        
            showQuestion()
        
        }
    }
    
    @IBAction func MaruButton(_ sender: Any) {
        checkAnswer(yourAnswer: true)
    }
    
    @IBAction func BatsuButton(_ sender: Any) {
        checkAnswer(yourAnswer: false)
    }
    

}

