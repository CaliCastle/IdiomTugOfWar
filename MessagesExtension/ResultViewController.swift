//
//  ResultViewController.swift
//  IdiomTugOfWar
//
//  Created by Cali Castle on 20/09/2016.
//  Copyright © 2016 Cali Castle. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    // MARK: Properties
    
    static let storyboardIdentifier = "ResultViewController"
    
    weak var delegate : ResultViewControllerDelegate?
    
    public var idiom: String?
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var idiomLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    var success: Bool?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if !success! {
            statusLabel.text = "抱歉"
            detailLabel.text = "并不是一个成语"
            view.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.3820888764, blue: 0.2271662791, alpha: 1)
        }
        
        idiomLabel.text = idiom!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.dismiss(animated: false, completion: {
                self.delegate?.resultDismissed()
            })
        }
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

protocol ResultViewControllerDelegate: class {
    func resultDismissed()
}
