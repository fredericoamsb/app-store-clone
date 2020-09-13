//
//  AppsHeaderCell.swift
//  App Store
//
//  Created by Frederico Augusto on 12/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import UIKit
import SDWebImage

class AppsHeaderCell: UICollectionViewCell {
    
    var appDestaque: AppDestaque? {
        didSet {
            if let appDestaque = appDestaque {
                empresaLabel.text = appDestaque.nome
                descricaoLabel.text = appDestaque.descricao
                imagemImageView.sd_setImage(with: URL(string: appDestaque.imagemUrl), completed: nil)
            }
        }
    }
    
    let empresaLabel: UILabel = .textLabel(text: "App Empresa", fontSize: 12)
    let descricaoLabel: UILabel = .textLabel(text: "App descrição header", fontSize: 20, numberOfLines: 2)
    let imagemImageView: UIImageView = .screenshotImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        empresaLabel.textColor = .blue
        
        let stackView = UIStackView(arrangedSubviews: [
            empresaLabel,
            descricaoLabel,
            imagemImageView
        ])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        addSubview(stackView)
        stackView.preencherSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
