//
//  QuizzViewController.swift
//  quizFlag
//
//  Created by Laurent Mery on 09/08/2018.
//  Copyright © 2018 Laurent Mery. All rights reserved.
//

import UIKit

class QuizzViewController: UIViewController {
    
    var titleQuizz: String = ""
    var datasContinent = [String: [String]]()
    var quizz = [[String]]()
    var qcm = [[String]]()

    let numQuestions = 3
    var currentQuizzIndex = 0
    var score = 0
    
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var imageFlag: UIImageView!
    
    @IBOutlet weak var button1: MyButton!
    @IBOutlet weak var button2: MyButton!
    @IBOutlet weak var button3: MyButton!
    @IBOutlet weak var button4: MyButton!
    
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
        
        runQuizz()
    }

    private func runQuizz() {
        
        popScreen.isHidden = true
        popButtonNext.setTitle((currentQuizzIndex+1) >= numQuestions ? "Terminer" : "Continuer", for: .normal)
        popButtonNext.isHidden = true
        displayScore()
        
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
            
            print(pays2Qcm)
            // on retire du panier des pays pour le qcm le pays à trouver
            pays2Qcm.remove(at: indexPaysATrouver)
            print(pays2Qcm)
            // et on ajoute dans le tableau temporaire du qcm, la bonne réponse
            qcmTemp[qcmShuffled[0]] = datasContinentTemp[indexPaysATrouver].first!
            
            //on ajoute dans le tableau temporaire pour le qcm les 3 autres mauvaise réponse
            for index in 1..<qcmShuffled.count {
                let rand = Int().getRandom(max: pays2Qcm.count)
                qcmTemp[qcmShuffled[index]] = pays2Qcm[rand].first!
                pays2Qcm.remove(at: rand)
                print(pays2Qcm)
                print("ok")
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
        
        displayScore()
        
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
    
    private func displayScore() {
        labelScore.text = "Score (\(score)) Question (\(currentQuizzIndex+1) / \(numQuestions))"
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
