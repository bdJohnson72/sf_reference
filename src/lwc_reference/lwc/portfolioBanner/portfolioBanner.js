/**
 * Created by brooksjohnson on 7/15/24.
 */

import {LightningElement} from 'lwc';
import  PortfolioAssets from '@salesforce/resourceUrl/PortfolioAssets'

export default class PortfolioBanner extends LightningElement {

    userPic = `${PortfolioAssets}/PortfolioAssets/userPic.jpeg`
    linkedIn = `${PortfolioAssets}/PortfolioAssets/Social/linkedin.svg`
    github = `${PortfolioAssets}/PortfolioAssets/Social/github.svg`
    youtube = `${PortfolioAssets}/PortfolioAssets/Social/youtube.svg`
    trailhead = `${PortfolioAssets}/PortfolioAssets/Social/trailhead1.svg`


    connectedCallback() {
       console.log(`resource URL is ${PortfolioAssets}`);
       console.log(`image is ${this.userPic}`);
    }

}