/**
 * Created by bjohnson on 2/11/24.
 */
//@ts-check
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
            sortable: true,
            typeAttributes:{
                label: {
                    fieldName: 'Name'
                },
                target: '_blank',
                tooltip: 'View Contact'
            }},
        {label: 'Account Name', fieldName: 'accountURL', type: 'url', sortable: true,
            typeAttributes: {
                label: {
                    fieldName: 'AccountName'
                },
                target: '_blank',
                tooltip: 'view account'
            }},
        {label: 'Email', fieldName: 'Email', type: 'email', sortable: true },
        {label: 'Phone', fieldName: 'Phone', type: 'phone', sortable: true},
        {label: 'City', fieldName: 'City', sortable: true},
        {label: 'Street', fieldName: 'Street', sortable: true},
        {label: 'City', fieldName: 'City', sortable: true},
        {label: 'State', fieldName: 'State', sortable: true},
        {label: 'Country', fieldName: 'Country', sortable: true},
        {label: 'Postal Code', fieldName: 'postalCode', sortable: true},
        {type: 'action',
            typeAttributes: {
                rowActions: this.rowActions,
                manualAlignment: 'auto'
            }}
    ]
    /** @type{Contact[]} */
    contacts = [];

    // sorts
   sortedBy = 'Name';
   sortedDirection = 'asc';
   defaultSortingDirection  = 'asc';
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
  handleSort(event){
       console.log('handle sort called')
       console.log(JSON.stringify(event.detail))
      const { fieldName: sortedBy, sortDirection: sortedDirection } = event.detail;
       const tempContacts = [...this.contacts];
       const reverse = sortedDirection === 'asc' ? 1 : -1;
       tempContacts.sort((a, b) => {
           if(a[sortedBy] > b[sortedBy]){
               return 1 * reverse;
           }else if (a[sortedBy] < b[sortedBy]){
               return - 1 * reverse;
           }else return 0;
       });
       this.sortedBy = sortedBy;
       this.sortedDirection = sortedDirection;
       this.contacts = tempContacts;
  }

}