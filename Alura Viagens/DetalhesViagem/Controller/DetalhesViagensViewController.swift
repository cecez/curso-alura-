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
    @IBOutlet weak var scrollPrincipal: UIScrollView!
    @IBOutlet weak var textFieldData: UITextField!
    
    // MARK: Outras propriedades
    var pacoteSelecionado: PacoteViagem? = nil
    
    // MARK: IBActions
    @IBAction func botaoVoltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func textFieldEntrouFoco(_ sender: UITextField) {
        // cria componente datePicker e seu formato
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        
        // exibe componente
        sender.inputView = datePicker
        
        // configura target para componente
        datePicker.addTarget(self, action: #selector(exibeDataTextField(sender:)), for: .valueChanged)
    }
    
    @IBAction func botaoFinalizarCompra(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "confirmacaoPagamento") as! ConfirmacaoPagamentoViewController
        
        controller.pacoteComprado = pacoteSelecionado
        
        self.present(controller, animated: true, completion: nil)
    }
    
    // MARK: LC
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // registro de observer quando teclado surgir
        NotificationCenter.default.addObserver(self, selector: #selector(aumentarScroll(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        if let pacote = pacoteSelecionado {
            self.imagemPacoteViagem.image           = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text       = pacote.viagem.titulo
            self.labelDescricaoPacoteViagem.text    = pacote.descricao
            self.labelDataViagem.text               = "válido para o período de: \(pacote.dataViagem)"
            self.labelPrecoPacoteViagem.text        = "R$ \(pacote.viagem.preco)"
        }
    }
    
    // MARK: Outros métodos
    @objc func aumentarScroll(notification: Notification) {
        self.scrollPrincipal.contentSize = CGSize(width: self.scrollPrincipal.frame.width, height: self.scrollPrincipal.frame.height + 320)
    }
    
    @objc func exibeDataTextField(sender: UIDatePicker) {
        let formatador = DateFormatter()
        formatador.dateFormat = "MM / yyyy"
        
        self.textFieldData.text = formatador.string(from: sender.date)
    }
    
    

}
