//
//  MarsPhotoInfo.swift
//  NasaApi
//
//  Created by ALFA on 21.10.2022.
//

import Foundation
struct PhotoInfo : Codable {
    
    var date : String
    let explanation : String
    let hdurl : String
    let media_type : String
    let service_version : String
    let title : String
    let url : URL

    enum CodingKeys: String, CodingKey {

        case date = "date"
        case explanation = "explanation"
        case hdurl = "hdurl"
        case media_type = "media_type"
        case service_version = "service_version"
        case title = "title"
        case url = "url"
    }
}
