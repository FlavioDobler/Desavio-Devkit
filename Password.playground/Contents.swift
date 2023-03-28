import UIKit
import Foundation

let lowerCase = CharacterSet.lowercaseLetters
let upperCase = CharacterSet.uppercaseLetters
let numbers = CharacterSet.decimalDigits
let spaces = CharacterSet.whitespaces
let special = CharacterSet(charactersIn: "!@#$%^&*()_+-=[]\\{}|;':\",./<>?")

func valPassword ( _ password: String!) -> Bool {
    //No minimo 3 characteres
    guard password.count >= 4 else { return false }
    
    //Primeira Letra Maiuscula!
    if password.prefix(1) != (password.prefix(1)).uppercased() {
        print("Não atende os requisitos!")
        return false
    }
    
    //Verifica especiais
    if password.rangeOfCharacter(from: special) != nil {
        print("Não atende os requisitos!!")
        return false
    }
    
    //Verifica se tem letras minusculas, numeros e espaços em branco.
    if !password.unicodeScalars.contains(where:{ lowerCase.contains($0)}) &&
        !password.unicodeScalars.contains(where:{ numbers.contains($0)}) &&
        !(password.unicodeScalars.contains(where: {spaces.contains($0)})) &&
        password.count <= 15 && password.count >= 5 {
        print("Não atende os requisitos")
        return false
    }
    
    //Verfica sequencias
    for i in 0...(password.count - 4) {
        let currentChar = password[password.index(password.startIndex, offsetBy: i+3)]
        let nextChar = password[password.index(password.startIndex, offsetBy: i+2)]
        let nextNextChar = password[password.index(password.startIndex, offsetBy: i+1)]
        guard let currentNum = Int(String(currentChar)),
              let nextNum = Int(String(nextChar)),
              let nextNextNum = Int(String(nextNextChar)) else { continue }
        if currentNum - nextNum == 1 && nextNum - nextNextNum == 1 {
            print("Não atende os requisitos")
            return false
        }
    }
    print("Atende os requisitos!!")
    return true
}
let pass1 = "Tenta123tiva23"
valPassword(pass1)

