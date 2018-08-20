//
//  QuizzViewController.swift
//  quizFlag
//
//  Created by Laurent Mery on 09/08/2018.
//  Copyright © 2018 Laurent Mery. All rights reserved.
//

import UIKit
import MBCircularProgressBar

class QuizzViewController: UIViewController {
    
    var titleQuizz: String = ""
    var datasContinent = [String: [String]]()
    var quizz = [[String]]()
    var qcm = [[String]]()

    let numQuestions = 3
    var currentQuizzIndex = -1
    var score = -1
    
    @IBOutlet weak var popTitle: UIVisualEffectView!
    @IBOutlet weak var labelTitre: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var imageFlag: UIImageView!
    
    @IBOutlet weak var button1: MyButton!
    @IBOutlet weak var button2: MyButton!
    @IBOutlet weak var button3: MyButton!
    @IBOutlet weak var button4: MyButton!
    
    @IBOutlet weak var viewTimer: MBCircularProgressBarView!
    
    //popup
    @IBOutlet weak var popScreen: UIVisualEffectView!
    @IBOutlet weak var popFlagImg: UIImageView!
    @IBOutlet weak var popLabelWin: UILabel!
    @IBOutlet weak var popLabelDesc: UILabel!
    
    @IBOutlet weak var popButtonNext: MyButton!
    
    @IBAction func handleButtonNext(_ sender: Any) {
        next()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = titleQuizz
        generateQuizz()
        
        start()
    }
    
    private func start() {
        initTimer()
        hideTimer()
        
        button1.isHidden = true
        button2.isHidden = true
        button3.isHidden = true
        button4.isHidden = true
        
        displayTop()
        
        imageFlag.image = #imageLiteral(resourceName: "logo")
        popButtonNext.setTitle("Démarrer", for: .normal)
        popButtonNext.isHidden = false
    }
    
    private func startTimer() {
        viewTimer.isHidden = false
        viewTimer.value = 0
        UIView.animate(withDuration: 10.0) {
            self.viewTimer.value = 60
        }
    }
    
    private func hideTimer() {
        viewTimer.isHidden = true
    }

    private func initTimer() {
        
    }
    
    private func runQuizz() {
        
        button1.isHidden = false
        button2.isHidden = false
        button3.isHidden = false
        button4.isHidden = false
        
        startTimer()
        score = 0
        
        popScreen.isHidden = true
        popButtonNext.setTitle((currentQuizzIndex+1) >= numQuestions ? "Terminer" : "Continuer", for: .normal)
        popButtonNext.isHidden = true
        displayTop()
        
        let currentQcm = qcm[currentQuizzIndex]
        let currenrQuizz = quizz[currentQuizzIndex]
        
        imageFlag.image = UIImage.init(imageLiteralResourceName: currenrQuizz.first!)
        
        button1.tag = currentQcm[0]==currenrQuizz.first! ? 1 : 0
        button2.tag = currentQcm[1]==currenrQuizz.first! ? 1 : 0
        button3.tag = currentQcm[2]==currenrQuizz.first! ? 1 : 0
        button4.tag = currentQcm[3]==currenrQuizz.first! ? 1 : 0
        
        button1.setTitle(countryName(from: currentQcm[0]), for: .normal)
        button2.setTitle(countryName(from: currentQcm[1]), for: .normal)
        button3.setTitle(countryName(from: currentQcm[2]), for: .normal)
        button4.setTitle(countryName(from: currentQcm[3]), for: .normal)
    }
    
    private func convertDicToArray (dic: [String: [String]]) -> [[String]] {
        
        var arrayToReturn = [[String]]()
        for keyFlag in dic {
            
            arrayToReturn.append(keyFlag.value)
        }
        return arrayToReturn
    }
    
    private func generateQuizz () {
        
        var datasContinentTemp = convertDicToArray(dic: datasContinent)
        
        for _ in 0..<numQuestions {
            var pays2Qcm = convertDicToArray(dic: datasContinent)
            
            //on créé un ordre alétoire dans la présentation du qcm
            var qcmShuffled = getShuffledQCM()
            var qcmTemp = ["", "", "", ""]
            
            //on choisi au hasard le pays à trouver pour la question _ du quizz
            let indexPaysATrouver = Int().getRandom(max: datasContinentTemp.count)
            //et on l'ajoute au tableau du quizz
            quizz.append(datasContinentTemp[indexPaysATrouver]);

            // on retire du panier des pays pour le qcm le pays à trouver
            pays2Qcm.remove(at: indexPaysATrouver)

            // et on ajoute dans le tableau temporaire du qcm, la bonne réponse
            qcmTemp[qcmShuffled[0]] = datasContinentTemp[indexPaysATrouver].first!
            
            //on ajoute dans le tableau temporaire pour le qcm les 3 autres mauvaise réponse
            for index in 1..<qcmShuffled.count {
                let rand = Int().getRandom(max: pays2Qcm.count)
                qcmTemp[qcmShuffled[index]] = pays2Qcm[rand].first!
                pays2Qcm.remove(at: rand)
            }
            qcm.append(qcmTemp)
            datasContinentTemp.remove(at: indexPaysATrouver)
        }
    }
    
    @IBAction func buttonQcmHandle(_ sender: MyButton) {
        
        score += sender.tag
        let country = quizz[currentQuizzIndex]
        
        imageFlag.image = #imageLiteral(resourceName: "logo")
        popFlagImg.image = UIImage.init(imageLiteralResourceName: country.first!)
        
        popLabelWin.text = sender.tag == 1 ? "Gagné !" : "Perdu !"
        popLabelDesc.text = sender.tag == 1 ? countryName(from: country.first!) : "La bonne réponse était : " + countryName(from: country.first!)
        popScreen.isHidden = false
        popButtonNext.isHidden = false
        
        displayTop()
        
    }
    
    private func next() {
        
        currentQuizzIndex = currentQuizzIndex + 1
        
        if (currentQuizzIndex < numQuestions) {
            runQuizz()
        }
        else {
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    private func displayTop() {
        if score == -1 {
            popTitle.isHidden = false
            labelTitre.isHidden = false
            labelTitre.text = "Quizz \(titleQuizz)"
            labelScore.text = ""
            labelQuestion.text = ""
        }
        else {
            popTitle.isHidden = true
            labelTitre.isHidden = true
            labelScore.text = "Score : \(score)"
            labelQuestion.text = "\(currentQuizzIndex+1) / \(numQuestions)"
        }
    }
    
    private func getShuffledQCM() -> [Int] {
        var shuffleQCM = [0, 1, 2, 3]
        var shuffledQCM = [Int]()
    
        for _ in 0..<shuffleQCM.count {
            let rand = Int().getRandom(max: shuffleQCM.count)
            shuffledQCM.append(shuffleQCM[rand])
            shuffleQCM.remove(at: rand)
        }
        return shuffledQCM
    }
    
    private func countryName(from countryCode: String) -> String {
        if let name = (Locale.current as NSLocale).displayName(forKey: .countryCode, value: countryCode) {
            // Country name was found
            return name
        } else {
            // Country name cannot be found
            return countryCode
        }
    }
}
