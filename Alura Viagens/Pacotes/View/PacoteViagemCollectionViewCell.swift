//
//  PacoteViagemCollectionViewCell.swift
//  Alura Viagens
//
//  Created by Cezar Castro Rosa on 28/10/20.
//

import UIKit

class PacoteViagemCollectionViewCell: UICollectionViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var imagemViagem: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    
    func configuraCelular(pacote: PacoteViagem) {
        
        labelTitulo.text                   = pacote.viagem.titulo
        labelQuantidadeDias.text           = "\(pacote.viagem.quantidadeDeDias) dias"
        labelPreco.text                    = "R$ \(pacote.viagem.preco)"
        imagemViagem.image                 = UIImage(named: pacote.viagem.caminhoDaImagem)
        
        // borda do item
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        self.layer.cornerRadius = 8
    }
    
}
