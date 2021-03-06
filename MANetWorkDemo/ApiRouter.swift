//
//  UserRouter.swift
//  KF5Swift
//
//  Created by admin on 17/6/28.
//  Copyright © 2017年 ma. All rights reserved.
//

import Foundation
import MANetWork
import Alamofire

// MARK: - 网络请求
public enum ApiRouter : Routerable{
    
    
    /// tag列表
    case tags
    /// commit列表
    case commits
    /// commit内容
    case commit(sha: String)
    
    public var http: (String, RouterMethod, RouterParam, Bool){
        var path: String = ""
        let method: RouterMethod = .get
        let parameters: RouterParam = [:]
        let useCache = true
        
        switch self{
        case .tags:
            path = "tags"
        case .commits:
            path = "commits"
        case let .commit(sha):
            path = "commits/\(sha)"
        }
        return (path, method, parameters, useCache)
    }
    /// header
    public var headerFields: [String: String]{
        var header: [String:String] = [:]
        
        header["version"] = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        header["type"] = "ios"
        header["Content-Type"] = "application/json"
        return header
    }
    
    public var defaultParameters: RouterParam {
        return ["version":"1.9"]
    }
    public var baseURL: String? {
        return "https://api.github.com/repos/Alamofire/Alamofire"
    }
}
