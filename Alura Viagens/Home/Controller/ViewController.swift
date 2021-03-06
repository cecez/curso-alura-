//
//  ViewController.swift
//  Alura Viagens
//
//  Created by Cezar Castro Rosa on 14/10/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Atributos e Outlets
    @IBOutlet weak var tabelaDeViagens: UITableView!
    @IBOutlet weak var viewHoteis: UIButton!
    @IBOutlet weak var viewPacotes: UIButton!
    
    let listaDeViagens: [Viagem] = ViagemDAO().retornaTodasAsViagens()
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaDeViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let viagemAtual = listaDeViagens[indexPath.row]
        
        cell.configuraCelula(viagem: viagemAtual)
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // testa se dispositivo é telefone
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 175 : 260;
    }
    
    // MARK: LCV
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabelaDeViagens.dataSource = self
        self.tabelaDeViagens.delegate   = self
        
        // arredondando view
        self.viewHoteis.layer.cornerRadius = 10
        self.viewPacotes.layer.cornerRadius = 10
    }


}

