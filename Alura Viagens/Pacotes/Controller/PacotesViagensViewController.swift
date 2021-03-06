//
//  PacotesViagensViewController.swift
//  Alura Viagens
//
//  Created by Cezar Castro Rosa on 28/10/20.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    // MARK: Dados
    let listaComTodasViagens: [PacoteViagem]  = PacoteViagemDAO().retornaTodasAsViagens()
    var listaDeViagens: [PacoteViagem]        = []
    
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
        
        let pacoteViagem = listaDeViagens[indexPath.item]
        
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
                
        celula.configuraCelular(pacote: pacoteViagem)
        
        return celula
    }
    
    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pacote      = listaDeViagens[indexPath.item]
        let storyboard  = UIStoryboard(name: "Main", bundle: nil)
        let controller  = storyboard.instantiateViewController(identifier: "detalhesViagens") as! DetalhesViagensViewController
        
        // envia pacote selecionado ao próximo view controller
        controller.pacoteSelecionado = pacote
        
        // chama viewcontroller através do navigation controller
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if (UIDevice.current.userInterfaceIdiom == .phone) {
            // iPhones (2 colunas)
            return CGSize(width: (collectionView.bounds.width / 2) - 20, height: 160)
        } else {
            // iPad e outros (3 colunas)
            return CGSize(width: (collectionView.bounds.width / 3) - 20, height: 250)
        }
        
        
    }
    
    // MARK: UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        // inicializa com todas viagens
        listaDeViagens = listaComTodasViagens
        
        // se houver pesquisa, faz filtragem
        if (searchText != "") {
            listaDeViagens = listaDeViagens.filter({ $0.viagem.titulo.contains(searchText) })
        }
        
        // atualiza label
        labelContadorDePacotes.text = atualizaContadorDePacotes()

        // atualiza collection
        colecaoPacotesViagem.reloadData()
    }

}
