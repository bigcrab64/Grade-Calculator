//
//  ViewController.swift
//  Grade Calculator
//
//  Created by De La Torre, Julian - Student on 9/1/22.
//

import UIKit

@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var CurrentGradeInput: UITextField!
    
    @IBOutlet weak var TestWeightInput: UITextField!
    
    @IBOutlet weak var TargetGradeInput: UITextField!
    
    
    @IBOutlet weak var ErrorMessage: UILabel!
    
    @IBOutlet weak var RequiredScoreBox: UILabel!
    
    @IBOutlet weak var AdviceLabel: UILabel!
    
    var CurrentGradeString = ""
    var TestWeightString = ""
    var TargetGradeString = ""
    
    let GreenColor = UIColor.init(red: 0.0, green: 0.950, blue: 0.57, alpha: 1.0)
    let redColor = UIColor.init(red: 0.925, green: 0.25, blue: 0.3, alpha: 1.0)
    
    @IBAction func CalculateButton(_ sender: UIButton) {
        CurrentGradeInput.resignFirstResponder()
        TestWeightInput.resignFirstResponder()
        TargetGradeInput.resignFirstResponder()
        
        if CurrentGradeInput.text == "" || TestWeightInput.text == "" || TargetGradeInput.text == ""{
            ErrorMessage.text = "Invalid Input"
        }
        else{
            ErrorMessage.text = ""
            CurrentGradeString = CurrentGradeInput.text ?? ""
            TestWeightString = TestWeightInput.text ?? ""
            TargetGradeString = TargetGradeInput.text ?? ""
            
            let CurrentGradeFloat = Float(CurrentGradeString) ?? 0
            let TestWeightFloat = Float(TestWeightString) ?? 0
            let TargetGradeFloat = Float(TargetGradeString) ?? 0
            
            let CurrentGradeDecimal = CurrentGradeFloat/100
            let NonTestGrade = 100 - TestWeightFloat
            
            let CurrentPercent = NonTestGrade * CurrentGradeDecimal
            let TestPercentFraction = TargetGradeFloat - CurrentPercent

            let RequiredScore = (TestPercentFraction / TestWeightFloat) * 100
            let RoundedRequiredScore = round(RequiredScore * 100) / 100
            
            RequiredScoreBox.text = String(Int(RoundedRequiredScore)) + "%"
            if RequiredScore <= 100{
                view.backgroundColor = GreenColor
                AdviceLabel.isHidden = true
            }
            else{
                view.backgroundColor = redColor
                AdviceLabel.isHidden = false
            }
            
        }
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

