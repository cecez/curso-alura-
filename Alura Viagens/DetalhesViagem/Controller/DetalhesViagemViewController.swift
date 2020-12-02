//
//  DetalhesViagemViewController.swift
//  Alura Viagens
//
//  Created by Cezar Castro Rosa on 03/11/20.
//

import UIKit

class DetalhesViagemViewController: UIViewController {
    
    // MARK: IBOUtlet e IBAction
    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    @IBOutlet weak var labelDataViagem: UILabel!
    @IBOutlet weak var labelPrecoPacoteViagem: UILabel!
    
    @IBAction func voltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var pacoteSelecionado: PacoteViagem? = nil
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("carregou 2");

        if let pacote = pacoteSelecionado {
            self.imagemPacoteViagem.image           = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text       = pacote.viagem.titulo
            self.labelDescricaoPacoteViagem.text    = pacote.descricao
            self.labelDataViagem.text               = pacote.dataViagem
            self.labelPrecoPacoteViagem.text        = pacote.viagem.preco
            
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
