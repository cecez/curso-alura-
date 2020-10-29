//
//  PacotesViagensViewController.swift
//  Alura Viagens
//
//  Created by Cezar Castro Rosa on 28/10/20.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource {
    
    // MARK: Dados
    let listaDeViagens: [Viagem] = ViagemDAO().retornaTodasAsViagens()

    // MARK: IBOutlet
    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoPacotesViagem.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaDeViagens.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let viagemAtual = listaDeViagens[indexPath.item]
        
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
                
        celula.labelTitulo.text                   = viagemAtual.titulo
        celula.labelQuantidadeDias.text           = "\(viagemAtual.quantidadeDeDias) dias"
        celula.labelPreco.text                    = "R$ \(viagemAtual.preco)"
        celula.imagemViagem.image                 = UIImage(named: viagemAtual.caminhoDaImagem)
        
        // borda do item
        celula.layer.borderWidth = 0.5
        celula.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        celula.layer.cornerRadius = 8
        
        
        return celula
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
