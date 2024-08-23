import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/LwcRefController.getAccounts'

export default class MapsDemo extends LightningElement {

    mapMarkers = [];
    markersTitle = 'Accounts'
    selectedMarker;
   @wire(getAccounts)
   wiredAccounts({error, data}){
       if (data){
           console.log(data);
           this.formatResponse(data);
       }
       if (error){
           console.error(error);
       }
   }

   formatResponse(data){
       this.mapMarkers = data.map(item => {
           return {
               location: {
                   Street: item.BillingStreet || '',
                   City: item.BillingCity || '',
                   PostalCode: item.BillingPostalCode || '',
                   State: item.BillingState || '',
                   Country: item.BillingCountry || '',
               },
               icon: 'utility:salesforce1',
               title: item.Name,
               value: item.Name,
               description: item.Description,
           }
       })
       this.selectedMarker = this.mapMarkers.length && this.mapMarkers[0].value;
   }
   handleSelectedMarker(event){
        this.selectedMarker = event.detail.selectedMarkerValue;
   }
}

