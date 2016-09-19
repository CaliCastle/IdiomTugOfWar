//
//  StartUpViewController.swift
//  IdiomTugOfWar
//
//  Created by Cali Castle on 19/09/2016.
//  Copyright © 2016 Cali Castle. All rights reserved.
//

import UIKit

class StartUpViewController: UIViewController {

    // MARK: Properties
    
    static let storyboardIdentifier = "StartUpViewController"
    
    weak var delegate : StartUpViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startButtonDidTap(_ sender: AnyObject) {
        delegate?.startDidTap(self)
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

protocol StartUpViewControllerDelegate: class {
    func startDidTap(_ controller: StartUpViewController)
}
