//
//  appTableViewCell.swift
//  millionaireApp
//
//  Created by Cavidan Mustafayev on 15.12.23.
//

import UIKit

class appTableViewCell: UITableViewCell {

    
        @IBOutlet weak var questionLabel: UILabel!
        @IBOutlet weak var answerLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    func configureCell(model:Answer){
            answerLabel.text = model.answer
            contentView.backgroundColor = model.bgColor
        
    }

}
