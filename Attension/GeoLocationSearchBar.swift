//
//  GeoLocationSearchBar.swift
//  Attension
//
//  Created by Hiraku Ohno on 2016/04/07.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

import UIKit

class GeoLocationSearchBar: UISearchBar, UISearchBarDelegate {
    
    var searchButtonHandler: ((UISearchBar) -> Void)?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if let handler = searchButtonHandler {
            handler(searchBar)
        }
    }
}
