/**
 * Created by brooksjohnson on 5/1/24.
 */

import {LightningElement, wire} from 'lwc';
import getContacts from '@salesforce/apex/LwcRefController.getContacts'


export default class FilteringSortingDemo extends LightningElement {

    headings = ["Id", "Name", "Title", "Email"];
    tableData = [];
    filteredData = [];
    @wire(getContacts)
    wiredContacts({error, data}){
        if (data){
            this.filteredData = data;
            this.tableData = data;
        }
        if (error){
            console.error(error)
        }
    }

    filterHandler(event){
        const value = event.target.value.toLowerCase();
        this.filteredData = this.tableData.filter(record => {
            return Object.keys(record).some( key => {
                console.log(key)
                return record[key].toString().toLowerCase().includes(value);
            })
        })
        console.log('filtered data' + JSON.stringify(this.filteredData));
    }
}