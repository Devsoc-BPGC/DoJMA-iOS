//
//  HeraldPostData.swift
//  DoJMA
//
//  Created by Vandit Jain on 23/09/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import Foundation

struct post{
    let id: Int;
    let title: String;
    let date: String;
    let imageURLString: String;
    let postURLString: String;
    let content: String;
    
    init(json: [String:Any]) {
        id = json["id"] as? Int ?? -1
        title = json["title"] as? String ?? "";
        date = json["date"] as? String ?? "";
        postURLString = ""
        content = json["content"] as? String ?? "";
        
        guard let thumbnaildata = json["thumbnail_images"] as? [String:Any] else {
            imageURLString = "nil"
            return
        }
        let fulldata = thumbnaildata["full"] as! [String:Any];
        imageURLString = fulldata["url"] as? String ?? "";
    }
}

struct POST{
    let id: Int;
    let title: String;
    let date: String;
    let imageURLString: String;
    let postURLString: String;
    let content: String;
    
    init(json: [String:Any]) {
        id = json["id"] as? Int ?? -1
        title = json["title"] as? String ?? "";
        date = json["date"] as? String ?? "";
        postURLString = ""
        content = json["content"] as? String ?? "";
        
        guard let thumbnaildata = json["thumbnail_images"] as? [String:Any] else {
            imageURLString = "nil"
            return
        }
        let fulldata = thumbnaildata["full"] as! [String:Any];
        imageURLString = fulldata["url"] as? String ?? "";
    }
}
