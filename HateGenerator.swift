//
//  HateGenerator.swift
//  HateGenerator
//
//  Created by Kaz Born on 01/09/19.
//  Copyright © 2019 Kaz Born. All rights reserved.
//

import Foundation

class HateGenerator {
    
    private let xingamentos = ["fracassado", "vagabundo", "escroto", "babaca"]
    private let adjetivos   = ["arrogante", "covarde", "falso", "fingido", "mentiroso", "narcisista"]
    private let verbos1     = ["se enxerga", "morre", "morra", "some", "desaparece"]
    private let verbos2     = ["se enxergar", "morrer", "sumir", "desaparecer"]
    private let ligamentos  = ["... ", "! ", " "]
    
    /// This returns a string: "@\(random username): \(hate message)"
    public func generateHate () -> String {
        
        let message = generateHateMessage()
        
        let name  = randomUsername(length: Int.random(in: 5 ... 10))
        
        let hate = "@" + name + ": " + message
        print(hate)
        
        return hate
    }
    
    /// This returns a string: "\(random username)"
    public func randomUsername(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyz0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    /// This returns a string: "\(hate message)"
    public func generateHateMessage () -> String {
        var output = ""
        
        let structure = Int.random(in: 1 ... 9)
        
        switch structure {
        case 1:
            output += generateXingamento() // (voce é um ) + [xingamento] + [ligamento]
            output += generateAdjetivo()   // (voce é (muito ) OR deixa de ser ) + [adjetivo] + [ligamento]
            output += generateVerbo()      // [[verbos1] OR voce deveria [verbos2]] + [ligamento]
            
        case 2:
            output += generateXingamento() // (voce é um ) + [xingamento] + [ligamento]
            output += generateAdjetivo()   // (voce é (muito ) OR deixa de ser ) + [adjetivo] + [ligamento]
            
        case 3:
            output += generateXingamento() // (voce é um ) + [xingamento] + [ligamento]
            output += generateVerbo()      // [[verbos1] OR voce deveria [verbos2]] + [ligamento]
            
        case 4:
            output += generateXingamento() // (voce é um ) + [xingamento] + [ligamento]
            
        case 5:
            output += generateAdjetivo()   // (voce é (muito ) OR deixa de ser ) + [adjetivo] + [ligamento]
            output += generateVerbo()      // [[verbos1] OR voce deveria [verbos2]] + [ligamento]
            
        case 6:
            output += generateVerbo()      // [[verbos1] OR voce deveria [verbos2]] + [ligamento]
            output += generateXingamento() // (voce é um ) + [xingamento] + [ligamento]
            output += generateAdjetivo()   // (voce é (muito ) OR deixa de ser ) + [adjetivo] + [ligamento]
            
        case 7:
            output += generateVerbo()      // [[verbos1] OR voce deveria [verbos2]] + [ligamento]
            output += generateXingamento() // (voce é um ) + [xingamento] + [ligamento]
            
        case 8:
            output += generateVerbo()      // [[verbos1] OR voce deveria [verbos2]] + [ligamento]
            output += generateAdjetivo()   // (voce é (muito ) OR deixa de ser ) + [adjetivo] + [ligamento]
            
        case 9:
            output += generateVerbo()      // [[verbos1] OR voce deveria [verbos2]] + [ligamento]
            
        default:
            output = "Error on Switch #5"
        }
        
        let trimmed = output.trimmingCharacters(in: .whitespaces)
        
        let out = randomStyle(input: trimmed)
        
        return out
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
    
    private func generateVerbo () -> String {
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
        let n = Int.random(in: 0 ..< ligamentos.count)
        return ligamentos[n]
    }
}
