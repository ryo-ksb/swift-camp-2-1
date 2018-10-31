//
//  addQuestionViewController.swift
//  ShinMaruBatsuApp
//
//  Created by 小芝亮太 on 2018/10/29.
//  Copyright © 2018 小芝亮太. All rights reserved.
//

import UIKit

class addQuestionViewController: UIViewController {
    
    var questions: String!
    
    var answers: Bool!
    
    var queAns: [[String: Any]] = []
    
    @IBOutlet weak var questionLabel: UITextField!
    
    @IBAction func backButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var MaruBatsu: UISegmentedControl!
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func saveQuestion(_ sender: Any) {
        
        if MaruBatsu.selectedSegmentIndex == 0 {
            
            answers = false
            
        } else {
            
            answers = true
            
        }
        
        if questionLabel.text != "" {
            
            questions = questionLabel.text
        
            queAns = UserDefaults.standard.object(forKey: "queAns") as! [[String : Any]]
        
            queAns.append([
            
                "question": questions,
                "answer": answers
                
            ])
        
            UserDefaults.standard.set(queAns, forKey: "queAns")
            
        } else {
         
            showAlert(message: "問題文を入力してください")
        
        }
        
        questionLabel.text = ""
        
        questionLabel.endEditing(true)
        
        print("\(queAns)")
        
    }
     
    
    @IBAction func deleteQuestions(_ sender: Any) {
        
        UserDefaults.standard.removeObject(forKey: "queAns")
        
        UserDefaults.standard.set([], forKey: "queAns")
        
        showAlert(message: "問題をすべて削除しました")
        
        print("\(queAns)")
        
    }
    
    @IBAction func textKeyboard(_ sender: UITextField) {
        
        questionLabel.text = sender.text
    
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
