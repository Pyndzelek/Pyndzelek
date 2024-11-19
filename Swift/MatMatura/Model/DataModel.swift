//
//  DataModel.swift
//  matmatura szkielet
//
//  Created by Kamil on 09/11/2023.
//

import SwiftUI

struct Exercise: Decodable, Identifiable {
    var id: String
    let header: String
    let descriprion: String
    let image: String?
    let answer: String
    let solution: String?
}

struct MockData{
    
    static let sampleExercise = Exercise(id: "2023MPP01", header: "Zadanie 1 maj 2023", descriprion: "Na osi liczbowej zaznaczono sumę przedziałów. Dokończ zdanie. Wybierz właściwą odpowiedź spośród podanych.\n Zbiór zaznaczony na osi jest zbiorem wszystkich rozwiązań nierówności \n A. |x−3,5|≥1,5 \n B. |x−1,5|≥3,5 \n C. |x−3,5|≤1,5 \n D. |x−1,5|≤3,5", image: "2023MPP01", answer: "D", solution: nil)
    
    
    static let exercises: [Exercise] = [
        Exercise(id: "2023MPP01", header: "Zadanie 1 maj 2023(0-1)", descriprion: "Na osi liczbowej zaznaczono sumę przedziałów. Dokończ zdanie. Wybierz właściwą odpowiedź spośród podanych.\n Zbiór zaznaczony na osi jest zbiorem wszystkich rozwiązań nierówności \n A. |x−3,5|≥1,5 \n B. |x−1,5|≥3,5 \n C. |x−3,5|≤1,5 \n D. |x−1,5|≤3,5", image: "2023MPP01", answer: "D", solution: nil),
        
        Exercise(id: "2023MPP02", header: "Zadanie 2 maj 2023", descriprion: "Dokończ zdanie. Wybierz właściwą odpowiedź spośród podanych. \n Podana liczna jest równa", image: "2023MPP02", answer: "A", solution: nil),
        
        Exercise(id: "2023MPP03", header: "Zadanie 3 maj 2023", descriprion: "Wykaż, że dla każdej liczby naturalnej n ≥ 1 liczba (2n − 1)^2 − 1 jest podzielna przez 8.", image: "2023MPP03", answer: "doprowadzenie do postaci 4n(n+1) oraz stwierdzenie, że iloczyn n(n+1) jest liczbą parzystą", solution: nil),
        
        Exercise(id: "2023MPP04", header: "Zadanie 4 maj 2023", descriprion: "Dokończ zdanie. Wybierz właściwą odpowiedź spośród podanych.\n Liczba  log9 27 + log9 3 jest równa", image: "2023MPP04", answer: "D", solution: nil),
        
        Exercise(id: "2023MPP05", header: "Zadanie 5 maj 2023", descriprion: "Dokończ zdanie. Wybierz właściwą odpowiedź spośród podanych. Dla każdej liczby rzeczywistej a wyrażenie (2a − 3)^2 − (2a + 3)^2  jest równe", image: "2023MPP05", answer: "A", solution: nil),
        
        Exercise(id: "2023MPP06", header: "Zadanie 6 maj 2023", descriprion: "Dokończ zdanie. Wybierz właściwą odpowiedź spośród podanych.\n Zbiorem wszystkich rozwiązań podanej nierówności Jest przedział", image: "2023MPP06", answer: "C", solution: nil),
        
        Exercise(id: "2023MPP07", header: "Zadanie 7 maj 2023", descriprion: "Zadanie 7", image: nil, answer: "70", solution: nil),
        
        Exercise(id: "2023MPP08", header: "Zadanie 8 maj 2023", descriprion: "Zadanie 8", image: nil, answer: "80", solution: nil),
        Exercise(id: "2023MPP09", header: "Zadanie 9 maj 2023", descriprion: "Zadanie 9", image: nil, answer: "90", solution: nil),
    ]
    
    static let types: [String: [String]] = [
        "Liczby": ["2023MPP01", "2023MPP02", "2023MPP03"],
        "Funkcja": ["2023MPP04", "2023MPP05", "2023MPP06"],
        "Geometria": ["2023MPP07", "2023MPP08", "2023MPP09"],
        "Planimetria":["2023MPP01"],
        "Byle co": ["2023MPP07", "2023MPP08", "2023MPP09"],
        "Dupa": ["2023MPP01"],
    ]
    
    
    static func GetExercises(types: [String]) -> [Exercise] {
        var chosenExercises: [Exercise] = []
        var exerciesID: [String] = []
        
        for type in types {
            if (self.types[type] != nil) {
                for valueString in self.types[type]!{
                    exerciesID.append(valueString)
                }
            }
        }
        
        for id in exerciesID{
            let exercise = self.exercises.first(where: {$0.id == id})
            if (exercise != nil){
                chosenExercises.append(exercise!)
            }
        }
        
        return chosenExercises
    }
    
    
    static func getRandomExercises(count: Int) -> [Exercise]{
        var exercises = [Exercise]()
        for _ in 0...count{
            let randomExercise: Exercise = self.exercises.randomElement() ?? MockData.sampleExercise
            if !exercises.contains(where: {x in x.id == randomExercise.id}){
                exercises.append(randomExercise)
            }
        }
        return exercises
    }
}




