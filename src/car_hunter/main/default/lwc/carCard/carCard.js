/**
 * Created by bjohnson on 2/19/24.
 */

import {LightningElement} from 'lwc';
import NAME_FIELD from '@salesforce/schema/Car__c.Name';
import PICTURE_FIELD from '@salesforce/schema/Car__c.Picture__c';
import CATEGORY_FIELD from '@salesforce/schema/Car__c.Category__c';
import MAKE_FIELD from '@salesforce/schema/Car__c.Manufacturer__c';
import MSRP_FIELD from '@salesforce/schema/Car__c.MSRP__c';
import SEATS_FIELD from '@salesforce/schema/Car__c.NumberSeats__c';
import TRANSMISSION_FIELD from '@salesforce/schema/Car__c.Transmission__c';
import FUEL_FIELD from '@salesforce/schema/Car__c.Fuel_Type__c';

import {getFieldValue} from "lightning/uiRecordApi";
import {setDebugFlag} from "lightning/empApi";

export default class CarCard extends LightningElement {

    category = CATEGORY_FIELD;
    make = MAKE_FIELD;
    msrp = MSRP_FIELD;
    seats = SEATS_FIELD;
    transmission = TRANSMISSION_FIELD;
    fuel = FUEL_FIELD;

    recordId = 'a00O1000005rLgCIAU';
    pictureURL;
    nameValue;
    handleSearchChange(event){}

    handleFormLoaded(event){
        const {records} = event.detail;
        const recordData = records[this.recordId];
        this.pictureURL =  getFieldValue(recordData, PICTURE_FIELD)
        this.nameValue = getFieldValue(recordData, NAME_FIELD)
    }
}