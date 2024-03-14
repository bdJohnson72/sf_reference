

import {LightningElement, wire} from 'lwc';
import {getObjectInfo, getPicklistValues} from "lightning/uiObjectInfoApi";
import CAR_OBJECT from '@salesforce/schema/Car__c';
import CATEGORY_FIELD from '@salesforce/schema/Car__c.Category__c';
import MANUFACTURER_FIELD from '@salesforce/schema/Car__c.Manufacturer__c'
import { publish, MessageContext } from 'lightning/messageService';
import CAR_FILTER from '@salesforce/messageChannel/carFilters__c'
export default class CarFilter extends LightningElement {
    filters = {
        searchKey: '',
        maxValue: 999999
    }
    categoryData;
    manufacturerData;
    error;

    // load context for LMS
    @wire(MessageContext)
    messageContext;

    @wire(getObjectInfo, {objectApiName: CAR_OBJECT})
    carObjectInfo;

    @wire(getPicklistValues, {
        recordTypeId: '$carObjectInfo.data.defaultRecordTypeId',
        fieldApiName: CATEGORY_FIELD
    })
    categories({error, data}){
        if (data){
            console.dir(data);
            this.categoryData = data;
        }
        if(error){
            console.error(`error ${error}`)
        }
    }

    @wire(getPicklistValues, {
        recordTypeId: '$carObjectInfo.data.defaultRecordTypeId',
        fieldApiName: MANUFACTURER_FIELD
    })
    manufacturer({error, data}){
        console.log('in wire for make')
        if (error){
            console.error(error)
        }
        if (data){
            this.manufacturerData = data;
        }
    }

    handleSearchKeyChange(event){
        this.filters = {...this.filters, "searchKey": event.target.value}
        this.sendDataToCarList();
    }

    handleMaxValueChange(event){
        this.filters = {...this.filters, "maxPrice": event.target.value};
        this.sendDataToCarList();
    }

    handleCheckBoxChange(event){
        console.log('in handleCheckBoxChange')
        if(!this.filters.categories){
          const categories = this.categories.data.values.map(item => item.value);
           const manufacturer = this.manufacturerData.data.values.map(item => item.value);
            console.log(categories)
            console.log(manufacturer)
          //  this.filters = {...this.filters, categories, manufacturer};
           // console.log(this.filters);
        }
        const {name, value } = event.target.dataset;
      /*  if(event.target.checked){
            if(!this.filters[name].includes(value)){
                this.filters[name] = [...this.filters[name], value];
            }
        else {
            this.filters[name] = this.filters[name].filter(item => item !== value);
            }
        }
        console.log(name)
        console.log(value);
        this.sendDataToCarList();*/

    }

    sendDataToCarList(){
        publish(this.messageContext, CAR_FILTER, {
            filters: this.filters
        });
    }

}