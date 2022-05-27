//
//  AboutusViewController.swift
//  QazRecycle
//
//  Created by Tima on 24.04.2022.
//

import UIKit

class AboutusViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
   

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = """
         Our project is related to the digitalization of the waste recycling process, which can help our country to increase the level of cleanliness and encourages users to intelligently sort waste.
        """
        
    }
    

  
    

}
