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
    let listaDeViagens: [String] = ["Rio de Janeiro", "Porto Alegre", "Ceará"]
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaDeViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = listaDeViagens[indexPath.row]
    
        return cell
    }
    
    // MARK: LCV
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabelaDeViagens.dataSource = self
    }


}

