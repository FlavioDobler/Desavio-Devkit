import UIKit
import Foundation

let lowerCase = CharacterSet.lowercaseLetters
let upperCase = CharacterSet.uppercaseLetters
let numbers = CharacterSet.decimalDigits
let spaces = CharacterSet.whitespaces
let letters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")

func valPassword ( _ password: String!) -> Bool {
    
    //Primeira Letra Maiuscula!
    if password.prefix(1) != (password.prefix(1)).uppercased() {
        print("Não atende os requisitos!")
        return false
    }
    
    //Verifica se tem letras minusculas, numeros, espaços em branco e cumprimento!
    if !password.unicodeScalars.contains(where:{ lowerCase.contains($0)}) &&
        !password.unicodeScalars.contains(where:{ numbers.contains($0)}) &&
        !(password.unicodeScalars.contains(where: {spaces.contains($0)})) &&
        password.count <= 15 && password.count >= 5 &&
        password.rangeOfCharacter(from: letters.inverted) == nil {
        print("Não atende os requisitos")
        return false
    }
    
  //  Verifica sequencias
        password.forEach { char in
            if char.isWholeNumber {
                if char.wholeNumberValue == String(Int(password[char])) + 1{
                    print("Não atende os requisitos")
                }
            }
        }
        print("Atende os requisitos!!")
        return true
    }

let pass1 = "Tentativa235"
valPassword(pass1)

