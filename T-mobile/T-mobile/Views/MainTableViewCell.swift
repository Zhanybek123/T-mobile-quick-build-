//
//  MainTableViewCell.swift
//  T-mobile
//
//  Created by zhanybek salgarin on 6/21/23.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let cellID = "CellID"
    
    private var contentImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(contentImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentImage.frame = contentView.bounds
    }
    
    func configureImage(with image: String) {
        contentImage.image = UIImage(named: image)
    }
}
