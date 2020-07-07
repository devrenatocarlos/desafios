//
//  ViewController.swift
//  SuperSenha
//
//  Created by Douglas Frari on 01/07/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var bGeneratorPassword: UIButton!
    
    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumberOfCharacters: UITextField!
    @IBOutlet weak var swLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swCaptitalLetters: UISwitch!
    @IBOutlet weak var swSpecialCharacters: UISwitch!
    
    
    @IBAction func tfNumbersOfPasswordAction(_ sender: Any) {
        let totalPasswords = Int(tfTotalPasswords.text!)
        if(totalPasswords == 0 || totalPasswords! > 99){
            //bGeneratorPassword.isEnabled = false
            tfTotalPasswords.text = ""
            let dialogMessage = UIAlertController(title: "Confirm", message: "Valor não aceitável para a opção Quantidade de senhas", preferredStyle: .alert)
            
            // Create OK button with action handler
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Ok button tapped")
             })
            
            //Add OK button to a dialog message
            dialogMessage.addAction(ok)
            // Present Alert to
            self.present(dialogMessage, animated: true, completion: nil)
        }else{
            bGeneratorPassword.isEnabled = true
            bGeneratorPassword.alpha = 1
        }
    }
    
    
    @IBAction func tfNumbersOfCharactersAction(_ sender: Any) {
        let numberOfCharacters = Int(tfNumberOfCharacters.text!)
        if(numberOfCharacters == 0 || numberOfCharacters! > 16){
            tfNumberOfCharacters.text = ""
            let dialogMessage = UIAlertController(title: "Confirm", message: "Valor não aceitável para a opção Quantidade de caracteres", preferredStyle: .alert)
            
            // Create OK button with action handler
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Ok button tapped")
             })
            
            //Add OK button to a dialog message
            dialogMessage.addAction(ok)
            // Present Alert to
            self.present(dialogMessage, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func swLettersAction(_ sender: Any) {
        bGeneratorPassword.isEnabled = swLetters.isOn || swNumbers.isOn || swCaptitalLetters.isOn || swSpecialCharacters.isOn
        if !bGeneratorPassword.isEnabled {bGeneratorPassword.alpha = 0.3}else {bGeneratorPassword.alpha = 1}
    }
    
    
    @IBAction func swNumbersAction(_ sender: Any) {
        bGeneratorPassword.isEnabled = swLetters.isOn || swNumbers.isOn || swCaptitalLetters.isOn || swSpecialCharacters.isOn
        if !bGeneratorPassword.isEnabled {bGeneratorPassword.alpha = 0.3}else {bGeneratorPassword.alpha = 1}
    }
    
    
    @IBAction func swCapitalLettersAction(_ sender: Any) {
        bGeneratorPassword.isEnabled = swLetters.isOn || swNumbers.isOn || swCaptitalLetters.isOn || swSpecialCharacters.isOn
        if !bGeneratorPassword.isEnabled {bGeneratorPassword.alpha = 0.3}else {bGeneratorPassword.alpha = 1}
    }
    
    
    @IBAction func swSpecialCharactersAction(_ sender: Any) {
        bGeneratorPassword.isEnabled = swLetters.isOn || swNumbers.isOn || swCaptitalLetters.isOn || swSpecialCharacters.isOn
        if !bGeneratorPassword.isEnabled {bGeneratorPassword.alpha = 0.3}else {bGeneratorPassword.alpha = 1}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let passwordsViewController = segue.destination as! PasswordViewController
        
        // forma mais segura (usar if let)
        if let numberOfPasswords = Int(tfTotalPasswords.text!) {
            // se conseguir obter o valor do campo e converter para inteiro
            passwordsViewController.numberOfPasswords = numberOfPasswords
        }
        if let numberOfCharacters = Int(tfNumberOfCharacters.text!) {
            passwordsViewController.numberOfCharacters = numberOfCharacters
        }
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useCapitalLetters = swCaptitalLetters.isOn
        passwordsViewController.useLetters = swLetters.isOn
        passwordsViewController.useSpecialCharacters = swSpecialCharacters.isOn
        
        // forcar encerrar o modo de edicao // remove o foco e libera teclado
        view.endEditing(true)
        
    }
    

}

