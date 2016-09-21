//
//  InProgressViewController.swift
//  IdiomTugOfWar
//
//  Created by Cali Castle on 19/09/2016.
//  Copyright © 2016 Cali Castle. All rights reserved.
//

import UIKit

class InProgressViewController: UIViewController {

    static let storyboardIdentifier = "InProgressViewController"
    
    weak var delegate: InProgressViewControllerDelegate?
    
    var firstCharacter: String?
    
    @IBOutlet weak var firstCharacterLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    let limitLength = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textField.delegate = self
        firstCharacterLabel.text = firstCharacter
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension InProgressViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField.text?.characters.count)! != limitLength {
            let alert = UIAlertController(title: "字数错误", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "重试", style: .default, handler: { (action) in
                
            }))
            present(alert, animated: true, completion: { 
                
            })
            
            return false
        }
        
        textField.resignFirstResponder()
        delegate?.inProgressViewController(self, didEnter: firstCharacter! + textField.text!)
        
        return false
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        guard let text = textField.text else { return true }
//        
//        // TODO: Only Chinese.
//        
//        let newLength = text.characters.count + string.characters.count - range.length
//        return newLength <= limitLength
//    }
}

protocol InProgressViewControllerDelegate: class {
    func inProgressViewController(_ controller: InProgressViewController, didEnter value: String)
}
