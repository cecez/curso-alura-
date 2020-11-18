//
//  DetalhesViagensViewController.swift
//  Alura Viagens
//
//  Created by Cezar Castro Rosa on 16/11/20.
//

import UIKit

class DetalhesViagensViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    @IBOutlet weak var labelDataViagem: UILabel!
    @IBOutlet weak var labelPrecoPacoteViagem: UILabel!
    
    // MARK: Outros
    var pacoteSelecionado: PacoteViagem? = nil
    
    
    // MARK: LC
    override func viewDidLoad() {
        super.viewDidLoad()

        if let pacote = pacoteSelecionado {
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo
            self.labelDescricaoPacoteViagem.text = pacote.descricao
            self.labelDataViagem.text = pacote.dataViagem
            self.labelPrecoPacoteViagem.text = pacote.viagem.preco
        }
    }
    

    @IBAction func botaoVoltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
