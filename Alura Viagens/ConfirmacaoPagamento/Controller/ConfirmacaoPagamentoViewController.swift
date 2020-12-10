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
    @IBOutlet weak var botaoVoltarHome: UIButton!
    
    // MARK: Outros atributos
    var pacoteComprado: PacoteViagem? = nil
    
    // MARK: Actions
    @IBAction func botaoVoltarHome(_ sender: UIButton) {
        
        // retorna para raiz da navegação
        if let navegacao = self.navigationController {
            navegacao.popToRootViewController(animated: true)
        }
        
    }
    
    // MARK: LC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pacote = pacoteComprado {
            self.imagemPacoteViagem.image           = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text       = pacote.viagem.titulo.uppercased()
            self.labelDescricaoPacoteViagem.text    = pacote.descricao
            self.labelDataPacoteViagem.text         = pacote.dataViagem
            self.labelHotelPacoteViagem.text        = pacote.nomeDoHotel
            
            // imagem com bordas arredondadas
            self.imagemPacoteViagem.layer.cornerRadius = 10
            self.imagemPacoteViagem.layer.masksToBounds = true
            
            // botão com bordas arredondadas
            self.botaoVoltarHome.layer.cornerRadius = 8
        }

    }
    

}
