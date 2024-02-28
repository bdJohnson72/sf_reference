

import {LightningElement, wire} from 'lwc';
import {getObjectInfo, getPicklistValues} from "lightning/uiObjectInfoApi";
import CAR_OBJECT from '@salesforce/schema/Car__c';
import CATEGORY_FIELD from '@salesforce/schema/Car__c.Category__c';
import MANUFACTURER_FIELD from '@salesforce/schema/Car__c.Manufacturer__c'

export default class CarFilter extends LightningElement {
    filters = {
        searchKey: '',
        maxValue: 99999
    }
    categoryData;
    manufacturerData;
    error;

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
    }

    handleMaxValueChange(event){
        this.filters = {...this.filters, "maxValue": event.target.value};
    }

    handleCheckBoxChange(event){
        const {name, value } = event.target.dataset;
        console.log(name)
        console.log(value)
    }

}