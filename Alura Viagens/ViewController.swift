//
//  ViewController.swift
//  Alura Viagens
//
//  Created by Cezar Castro Rosa on 14/10/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let viagemAtual = listaDeViagens[indexPath.row]
        
        cell.textLabel?.text = viagemAtual.titulo
    
        return cell
    }
    
    // MARK: LCV
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabelaDeViagens.dataSource = self
        
        // arredondando view
        self.viewHoteis.layer.cornerRadius = 10
        self.viewPacotes.layer.cornerRadius = 10
    }


}

