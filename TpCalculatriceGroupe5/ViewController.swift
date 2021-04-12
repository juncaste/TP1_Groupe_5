//
//  ViewController.swift
//  TpCalc
//
//  Created by mbds on 08/04/2021.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var lblEcran: UILabel!
    
    var val: String? = ""
    var operat: String = ""
    var result: Double? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
        @IBAction func initialiserBtn(_ type: UIButton) {
            
            result = val == nil ? 0 : result
            val = (val ?? "") + (type.titleLabel?.text ?? "")
           lblEcran.text = val
            
        }

    
    @IBAction func onClickOperation(_ type: UIButton) {
        
        if (type.titleLabel?.text ?? "0" ) == "="{
            Calcul()
            if (result == nil ){
                lblEcran.text = "Erreur"
            } else{
                lblEcran.text = String(result ?? 0)
            }
            val = nil
            operat = ""
        } else {
            lblEcran.text = type.titleLabel?.text ?? ""
            Calcul()
            operat = type.titleLabel?.text ?? ""
            }
    
    }
    
    
    func Calcul() {
        var valN: Double
        switch operat {
        case "/":
            let deno = (Double(val ?? "1" ) ?? 0)
            if (deno == 0){
                result = nil
            } else{
                valN = result == 0 ? 1 : (result ?? 0)
                result = valN / deno
            }
            
        case "*":
            valN = result == 0 ? 1 : (result ?? 0)
            result = valN * (Double(val ?? "1") ?? 0)
        case "-":
            result = (result ?? 0) - (Double(val ?? "0") ?? 0)
        case "+":
            result = (result ?? 0) + (Double(val ?? "0") ?? 0)
        default:
            result = (result ?? 0) + (Double(val ?? "0") ?? 0)
        }
      
        
        
        val = ""
        
        
    }
    
    
    @IBAction func OnClickClear(_ sender: UIButton) {
        lblEcran.text = "0"
        val = ""
        operat = ""
        result = 0
    }
    
}

