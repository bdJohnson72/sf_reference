/**
 * Created by brooksjohnson on 6/17/24.
 */

import {LightningElement} from 'lwc';
import {countryCodeList} from "c/countryCodeList";
import currencyConverterAssets from '@salesforce/resourceUrl/currencyConverterAerssets'

export default class CurrencyConvertApp extends LightningElement {
    currencyImage = currencyConverterAssets + "/currencyConverterAssets/currency.svg"
    countryList = countryCodeList;
    countryFrom = "USD";
    countryTo = "EUR";

    handleChange(event){
        console.log('handle change called')
        const {name, value} = event;
        this[name] = value;
    }

    submitHandler(event){
        event.preventDefault();
        this.convert();
    }

    async convert(){
        const key = 'f4c278ebcbebbc6b673dc757f102517e'
      const url = `http://api.exchangerate.host/convert?access_key=${key}&from${this.countryFrom}&to=${this.countryTo}&amount=100`
        console.log(url)

       try {
            const result = await fetch(url);
            const jsonData = await result.json();
            console.log(jsonData)
       }catch (e){
            console.error(e.message)
       }
    }

}