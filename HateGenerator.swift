//
//  HateGenerator.swift
//  HateGenerator
//
//  Created by Kaz Born on 01/09/19.
//  Copyright © 2019 Kaz Born. All rights reserved.
//

import Foundation

class HateGenerator {
    
    let xingamentos = ["fracassado", "vagabundo", "escroto", "babaca"]
    let adjetivos   = ["arrogante", "covarde", "falso", "fingido", "mentiroso", "narcisista"]
    let verbos1     = ["se enxerga", "morre", "morra", "some", "desaparece"]
    let verbos2     = ["se enxergar", "morrer", "sumir", "desaparecer"]
    
    func generateHate () {
        
        var message = generateMessageStructure()
        message = randomStyle(input: message)
        
        let name  = randomString(length: Int.random(in: 5 ... 10))
        
        print("@" + name + ": " + message)
        
        
    }
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyz0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    private func generateMessageStructure () -> String {
        var output = ""
        
        let structure = Int.random(in: 1 ... 9)
        
        switch structure {
        case 1:
            output += generateXingamento()
            output += generateAdjetivo()
            output += generateVerbo()
            
        case 2:
            output += generateXingamento()
            output += generateAdjetivo()
            
        case 3:
            output += generateXingamento()
            output += generateVerbo()
            
        case 4:
            output += generateXingamento()
            
        case 5:
            output += generateAdjetivo()
            output += generateVerbo()
            
        case 6:
            output += generateVerbo()
            output += generateXingamento()
            output += generateAdjetivo()
            
        case 7:
            output += generateVerbo()
            output += generateXingamento()
            
        case 8:
            output += generateVerbo()
            output += generateAdjetivo()
            
        case 9:
            output += generateVerbo()
            
        default:
            output = "Error on Switch #5"
        }
        
        let trimmed = output.trimmingCharacters(in: .whitespaces)
        
        return trimmed
    }
    
    private func randomStyle (input: String) -> String {
        var output = ""
        
        let i = Int.random(in: 1 ... 3)
        
        switch i {
        case 1:
            output = input.replacingOccurrences(of: "vc", with: "voce")
        case 2:
            output = input.replacingOccurrences(of: "é", with: "eh")
        case 3:
            output = input.replacingOccurrences(of: "vc", with: "voce")
            output = output.replacingOccurrences(of: "é", with: "eh")
        default:
            print("Error on Switch Random Style")
        }
        
        return output
    }
    
    private func generateXingamento () -> String {
        var output = ""
        
        // Começo da frase
        var n = Int.random(in: 0 ... 1)
        switch n {
        case 1:
            output = "vc é um "
        default:
            output = ""
        }
        
        // Get xingamento
        n = Int.random(in: 0  ..< xingamentos.count)
        output += xingamentos[n]
        output += genLigamento()
        
        return output
    }
    
    private func generateAdjetivo () -> String {
        var output = ""
        
        // Começo da frase
        var n = Int.random(in: 0 ... 1)
        switch n {
        case 0:
            output = "vc é "
            let i = Int.random(in: 0 ... 1)
            switch i  {
            case 1:
                output += "muito "
            default:
                output += ""
            }
        case 1:
            output = "deixa de ser "
        default:
            output = ""
        }
        
        // Get adjetivo
        n = Int.random(in: 0 ..< adjetivos.count)
        output += adjetivos[n]
        output += genLigamento()
        
        return output
    }
    
    func generateVerbo () -> String {
        var output = ""
        
        let i = Int.random(in: 0 ... 1)
        
        switch i {
        case 0: // >>----> VERBO 1
            let n =  Int.random(in: 0 ..< verbos1.count)
            output = verbos1[n]
            
        case 1:  // >>----> VERBO 2
            let n = Int.random(in: 0 ..< verbos2.count)
            output = "vc deveria " + verbos2[n]
            
        default:
            print("Error in Switch Verbo")
        }
        
        output += genLigamento()
        
        return output
    }
    
    private func genLigamento () -> String {
        var output  = ""
        let n = Int.random(in: 0 ... 1)
        switch n {
        case 0:
            output += "... "
        case 1:
            output += "! "
        default:
            print("Error in Switch #4")
        }
        return output
    }
}
