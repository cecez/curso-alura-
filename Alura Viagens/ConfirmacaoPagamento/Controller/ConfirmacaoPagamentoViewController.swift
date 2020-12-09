//
//  ConfirmacaoPagamentoViewController.swift
//  Alura Viagens
//
//  Created by Cezar Castro Rosa on 09/12/20.
//

import UIKit

class ConfirmacaoPagamentoViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelHotelPacoteViagem: UILabel!
    @IBOutlet weak var labelDataPacoteViagem: UILabel!
    @IBOutlet weak var labelQuantidadePessoas: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    
    // MARK: Outros atributos
    var pacoteComprado: PacoteViagem? = nil
    
    // MARK: LC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pacote = pacoteComprado {
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo
            self.labelDescricaoPacoteViagem.text    = pacote.descricao
            self.labelDataPacoteViagem.text               = pacote.dataViagem
            self.labelHotelPacoteViagem.text    = pacote.nomeDoHotel
            }

    }
    

}
