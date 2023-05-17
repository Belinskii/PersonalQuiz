//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Марина Иванова on 15.05.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var animalDescriptionLabel: UILabel!
    
    var answersChosen: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        animalLabel.text = animalCounter(chosenAnswers: answersChosen)
        animalDescriptionLabel.text = getAnimal(description: animalLabel.text!)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
        }
    
    func animalCounter(chosenAnswers: [Answer]) -> String {
        var countedAnimals: [String: Int] = [:]
        var maxCount = 0
        var maxAnimal = ""
        
        for answer in chosenAnswers {
            countedAnimals["\(answer.animal.rawValue)"] = 0
        }
        
        for answer in chosenAnswers {
            if answer.animal.rawValue == "🐶" {
                countedAnimals["🐶"]! += 1
            } else if answer.animal.rawValue == "🐱" {
                countedAnimals["🐱"]! += 1
            } else if answer.animal.rawValue == "🐰" {
                countedAnimals["🐰"]! += 1
            } else {
                countedAnimals["🐢"]! += 1
            }
        }
        
        for (animal, count) in countedAnimals {
            if count > maxCount {
                maxCount = count
                maxAnimal = animal
            }
        }
            return maxAnimal
    }
    
    func getAnimal(description: String) -> String {
        if let animal = Animal(rawValue: Character(animalLabel.text!)) {
            
            return animal.definition
        } else {
            return ""
        }
    }
}


