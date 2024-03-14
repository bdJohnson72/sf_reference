/**
 * Created by bjohnson on 2/19/24.
 */

import {LightningElement, wire} from 'lwc';
import getCars from '@salesforce/apex/CarsController.getCars'
import CAR_FILTER from '@salesforce/messageChannel/carFilters__c';
import {subscribe, MessageContext} from 'lightning/messageService';


export default class CarTileList extends LightningElement {
   cars;
   filters = {};
   subscription;

    connectedCallback(){
        this.subscribeToMessageChannel();
    }

    subscribeToMessageChannel(){
        this.subscription = subscribe(
            this.messageContext,
            CAR_FILTER,
            (message) => this.handleMessage(message)
        );
    }
    handleMessage(message){
        console.log(message)
        this.filters = {...this.filters, ...message.filters};
    }
   @wire(MessageContext)
    messageContext;
    @wire(getCars, {filters: '$filters'})
    wiredCars({data, error}){
        if (data){
            console.log(data)
            this.cars = data;
        }
        else if (error){
            console.error(error);
        }
    }

}