//
//  BankAccountCellXibView.swift
//  WhereIsMyMoney
//
//  Created by sajede nouri on 9/8/19.
//  Copyright © 2019 sajede nouri. All rights reserved.
//

import UIKit

//protocol BanckAccountCellDelegate {
//    func didTapOnCell()
//}


class BankAccountCellXibView: UIView {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var balanceLbl: UILabel!
    
    override func awakeFromNib() {
        imageView?.cornerRadius =  LiveVariables.shared.defaultCornerRadius
        self.cornerRadius = LiveVariables.shared.defaultCornerRadius
    }
}
