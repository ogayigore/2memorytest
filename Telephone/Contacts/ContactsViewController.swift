//
//  ViewController.swift
//  Telephone
//
//  Created by Igor Ogai on 21.07.2021.
//

import UIKit

class ContactsViewController: UIViewController {
    
    //MARK:- Private Properties
    
    private(set) lazy var customView = view as! ContactsView
    
    private let contactService = ContactService()
    
    //MARK:- Lifecycle
    
    override func loadView() {
        view = ContactsView()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Контакты"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        contactService.getContacts()
    }
    
    //MARK:- Private Methods
    
    private func configure() {
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
    }

}

//MARK:- UITableViewDelegate & UITableViewDataSource

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactService.contactsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = contactService.contactsArray[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactCell.cell, for: indexPath) as? ContactCell else { return UITableViewCell() }
        cell.configureCell(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = contactService.contactsArray[indexPath.row]
        
        guard let url = URL(string: "tel://\(contact.phoneNumber)") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

