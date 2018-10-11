//
//  CountryList.swift
//  Vhortext
//
//  Created by MacBook Pro on 05/10/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import Foundation

extension CountryList{
    
    public var countryListAll: [Country] {
        let countries = Countries()
        let countryListAll = countries.countries
        return countryListAll
    }
    
}
