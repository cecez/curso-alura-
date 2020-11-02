//
//  PacotesViagensViewController.swift
//  Alura Viagens
//
//  Created by Cezar Castro Rosa on 28/10/20.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    // MARK: Dados
    let listaComTodasViagens: [Viagem]  = ViagemDAO().retornaTodasAsViagens()
    var listaDeViagens: [Viagem]        = []
    
    // MARK: IBOutlet
    @IBOutlet weak var pesquisarViagens: UISearchBar!
    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    @IBOutlet weak var labelContadorDePacotes: UILabel!
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoPacotesViagem.dataSource = self
        colecaoPacotesViagem.delegate   = self
        pesquisarViagens.delegate       = self
        listaDeViagens                  = listaComTodasViagens
        labelContadorDePacotes.text     = atualizaContadorDePacotes()

    }
    
    // MARK: Outros
    func atualizaContadorDePacotes() -> String {
        return listaDeViagens.count == 1 ? "1 pacote encontrado" : "\(listaDeViagens.count) pacote(s) encontrado(s)"
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
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width / 2) - 15, height: 160)
    }
    
    // MARK: UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        // inicializa com todas viagens
        listaDeViagens = listaComTodasViagens
        
        // se houver pesquisa, faz filtragem
        if (searchText != "") {
            let filtroListaViagem       = NSPredicate(format: "titulo contains %@", searchText)
            let listaFiltrada: [Viagem] = (listaDeViagens as NSArray).filtered(using: filtroListaViagem) as! Array
            listaDeViagens              = listaFiltrada
        }
        
        // atualiza label
        labelContadorDePacotes.text = atualizaContadorDePacotes()

        // atualiza collection
        colecaoPacotesViagem.reloadData()
    }

}
