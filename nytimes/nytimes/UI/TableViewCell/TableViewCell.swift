//
//  TableViewCell.swift
//  nytimes
//
//  Created by iOS Weeteam on 3/11/20.
//  Copyright © 2020 Dmytro Doroshchuk. All rights reserved.
//

import UIKit

enum TableViewCellDataType {
    case article(_ data: Article)
    case favorites(_ data: Favorites)
}

class TableViewCell: UITableViewCell {
    
    var favoriteAction: (() -> Void)?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        label.minimumScaleFactor = 0.5
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.setImage(UIImage(named: "star-fav"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    func setupCell(model: TableViewCellDataType) {
        switch model {
        case .article(let article):
            titleLabel.text = article.title
        case .favorites(let fav):
            titleLabel.text = fav.title
            self.button.setImage(UIImage(named: "star"), for: .normal)
        }
        
    }
    
    private func configureCell() {
        accessoryView = button as UIView
        selectionStyle = .none
        addSubview(titleLabel)
        titleLabel.fillSuperview(padding: UIEdgeInsets(top: 5, left: 15,
                                                       bottom: 5, right: 50))
        button.addAction(for: .touchUpInside) {
            self.button.setImage(UIImage(named: "star"), for: .normal)
            self.favoriteAction?()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
