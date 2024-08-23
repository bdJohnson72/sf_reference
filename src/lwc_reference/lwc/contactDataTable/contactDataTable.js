/**
 * Created by bjohnson on 2/11/24.
 */

import {LightningElement} from 'lwc';
import getContacts from '@salesforce/apex/DataTableControllers.getContacts'
export default class ContactDataTable extends LightningElement {
    rowActions =  [
        {
            label: 'View',
            name: 'view'
        },
        {
            label: 'Edit',
            name: 'edit'
        },
        {
            label: 'Delete',
            name: 'delete'
        }
    ];
    columns = [
        {label: 'Name', fieldName: 'contactURL',
            type: 'url',
            typeAttributes:{
                label: {
                    fieldName: 'Name'
                },
                target: '_blank',
                tooltip: 'View Contact'
            }},
        {label: 'Account Name', fieldName: 'accountURL', type: 'url',
            typeAttributes: {
                label: {
                    fieldName: 'AccountName'
                },
                target: '_blank',
                tooltip: 'view account'
            }},
        {label: 'Email', fieldName: 'Email', type: 'email'},
        {label: 'Phone', fieldName: 'Phone', type: 'phone'},
        {label: 'City', fieldName: 'City'},
        {label: 'Street', fieldName: 'Street'},
        {label: 'City', fieldName: 'City'},
        {label: 'State', fieldName: 'State'},
        {label: 'Country', fieldName: 'Country'},
        {label: 'Postal Code', fieldName: 'postalCode'},
        {type: 'action',
            typeAttributes: {
                rowActions: this.rowActions,
                manualAlignment: 'auto'
            }}
    ]
    contacts = [];

   connectedCallback() {
       this.loadData();

  }

  loadData(){
       getContacts().then(data => {
           console.log(data)
           data.forEach(contact =>{
               contact.contactURL = `/${contact.Id}`;
               contact.accountURL = `/${contact.Account?.Id}`
               contact.AccountName = contact.Account?.Name;
               contact.City = contact.MailingAddress?.city;
               contact.Street = contact.MailingAddress?.street;
               contact.State = contact.MailingAddress?.state;
               contact.Country = contact.MailingAddress?.country;
               contact.postalCode = contact.MailingAddress?.postalCode
           })
           this.contacts = data;
       }).catch(error => console.error(e))
  }

  handleRowAction(event){
       const actionName = event.detail?.action?.name;
       const rowData = event.detail?.row;
       console.log(actionName);
       console.log(rowData);
       switch (actionName){
           case 'view':
               console.log('view');
               break;
           case 'edit':
               console.log('edit');
               break;
           case 'delete':
               console.log('delete');
               break
       }
  }

}