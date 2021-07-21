//
//  ContactService.swift
//  Telephone
//
//  Created by Igor Ogai on 21.07.2021.
//

import UIKit
import Contacts

class ContactService {
    
    private var contactStore = CNContactStore()

    var contactsArray = [Contact]()
    
    func getContacts() {
        
        contactStore.requestAccess(for: .contacts) { success, error in
            if success {
                print("Authorization success")
            }
        }
        
        let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey, CNContactImageDataKey] as [CNKeyDescriptor]
        
        let request = CNContactFetchRequest(keysToFetch: keys)
        
        request.sortOrder = CNContactSortOrder.familyName
        try? contactStore.enumerateContacts(with: request, usingBlock: { contact, stopPointer in
            
            let fullName = contact.givenName + " " + contact.familyName
            guard let phoneNumber = contact.phoneNumbers.first?.value.stringValue.filter("+0123456789".contains) else { return }
            
            var avatarImg: UIImage?
            
            if let avatar = contact.imageData {
                avatarImg = UIImage(data: avatar)
            } else {
                avatarImg = UIImage(named: "avatar")
            }
            
            let contactModel = Contact(name: fullName, phoneNumber: phoneNumber, img: avatarImg!)
            
            self.contactsArray.append(contactModel)
        })
    }
    
}
