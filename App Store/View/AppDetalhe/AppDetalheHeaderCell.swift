//
//  AppDetalheHeaderCell.swift
//  App Store
//
//  Created by Frederico Augusto on 12/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import UIKit

class AppDetalheHeaderCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            if let app = app {
                iconeImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
                nomeLabel.text = app.nome
                empresaLabel.text = app.empresa
            }
        }
    }
    
    let iconeImageView: UIImageView = .iconeImageView(width: 128, height: 128)
    let nomeLabel: UILabel = .textLabel(text: "App nome", fontSize: 20, numberOfLines: 2)
    let empresaLabel: UILabel = .textLabel(text: "App empresa", fontSize: 14)
    let obterButton: UIButton = .obterButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        iconeImageView.image = UIImage(named: "icone")
        
        let buttonStackView = UIStackView.init(arrangedSubviews: [
            obterButton,
            UIView()
        ])
        
        let tituloEmpresaStackView = UIStackView.init(arrangedSubviews: [
            nomeLabel,
            empresaLabel,
            buttonStackView
        ])
        tituloEmpresaStackView.spacing = 12
        tituloEmpresaStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [
            iconeImageView,
            tituloEmpresaStackView
        ])
        stackView.alignment = .center
        stackView.spacing = 12
        
        addSubview(stackView)
        stackView.preencherSuperview(padding: .init(top: 0, left: 20, bottom: 0, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
