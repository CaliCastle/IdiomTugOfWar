//
//  CollaborateViewController.swift
//  IdiomTugOfWar
//
//  Created by Cali Castle on 20/09/2016.
//  Copyright © 2016 Cali Castle. All rights reserved.
//

import UIKit

class CollaborateViewController: UIViewController {

    static let storyboardIdentifier = "CollaborateViewController"
    
    weak var delegate: CollaborateViewControllerDelegate?
    
    let limitLength = 1
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textField.delegate = self
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

protocol CollaborateViewControllerDelegate: class {
    func beginChallenge(with character: String)
}

extension CollaborateViewController: UITextFieldDelegate {
    /// Limit the length of the text field input.
    ///
    /// - parameter textField: The associated text field.
    /// - parameter range:     The range of the text.
    /// - parameter string:    String to be replaced.
    ///
    /// - returns: Should insert or not
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        
        // TODO: Only Chinese.
        
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= limitLength
    }
    
    /// Dismiss keyboard and ask delegate to generate the message.
    ///
    /// - parameter textField: Associated text field.
    ///
    /// - returns: Should return or not.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        delegate?.beginChallenge(with: textField.text!)

        return false
    }
}
