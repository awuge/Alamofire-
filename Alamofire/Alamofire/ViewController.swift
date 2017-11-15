//
//  ViewController.swift
//  Alamofire
//
//  Created by wu on 2017/11/14.
//  Copyright © 2017年 company. All rights reserved.
//

import UIKit
import Alamofire
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //get方式
        Alamofire.request("http://httpbin.org/get").responseJSON { (dataResponse) in
            //            print("---\(dataResponse)");
            guard  let result = dataResponse.result.value , let resonpse =  dataResponse.response ,let request = dataResponse.request else{return}
                        print("结果=\(result) 请求 =\(request) 响应=\(resonpse)")
        }
        
        //post方式
        
        Alamofire.request("http://httpbin.org/get", method: HTTPMethod.post, parameters: ["name":"hello"], encoding: URLEncoding.default, headers: nil).responseJSON { (dataRespons) in
            
            print(dataRespons.response ?? "响应失败")
            print(dataRespons.result.value ?? "请求失败")
        }
        
        //调用封装的函数
        NetworkTools.requestData(type: .GET, URLStirng: "http://httpbin.org/get", paramer: nil) { (reslut) in
            //打印结果
            print("结果是:\(reslut)")
        }
    }
}

