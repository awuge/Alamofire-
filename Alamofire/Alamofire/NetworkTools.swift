//
//  NetworkTools.swift
//  test
//
//  Created by wu on 2017/11/15.
//  Copyright © 2017年 company. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case GET
    case POST
}

class NetworkTools{

    class func requestData(type: MethodType, URLStirng: String, paramer: [String : String]? = nil ,finishCallBack:@escaping (_ result: AnyObject)->()){
        //1.获取类型
      let method = type == .GET ? HTTPMethod.get : HTTPMethod.post
        //发送网络请求
        Alamofire.request(URLStirng, method: method, parameters: paramer, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            //3.获取结果
            guard let result = response.result.value else{
                
                print(response.result.error ?? "faile")
                return
            }
            //4.将结果回调回去
            finishCallBack(result as AnyObject)
        }
    }
}
