//
//  Request.swift
//  COVID-19_Safe_Restaurant
//
//  Created by 준수김 on 2021/10/11.
//

import UIKit
import Alamofire

class Request {
    
    func getRequestData(_ viewController: ViewController) {
        let url = "http://211.237.50.150:7080/openapi/57c98321a0a1a87daac8477bfa1863558b3c7163cd54c0cd3b9e58e9058dc6d0/json/Grid_20200713000000000605_1/1/50"
        
        let params: Parameters = [
            "API_KEY": "7c98321a0a1a87daac8477bfa1863558b3c7163cd54c0cd3b9e58e9058dc6d0",
            "TYPE": "json",
            "API_URL": "Grid_20200713000000000605_1",
            "START_INDEX": 1,
            "END_INDEX": 20,
            "RELAX_SI_NM": "경상북도",
            "RELAX_SIDO_NM": "구미시"

        ]
        
        // HTTP Method: GET
        AF.request(url, //어떤 URL을 사용할 것인가?
                   method: .get, //어떤 메서드를 사용할 것인가?
                   parameters: params, //어떤 parameter를 사용할 것인가?
                   headers: nil)
            .responseDecodable(of: Restaurant.self) { response in //responseDecodable은 원하느 타입으로 Response받기 위해서 필요함.
                
                switch response.result { //성공, 실패여부에 따라 분기문 설정
                
                case .success(let response):
                    print("DEBUG>> OpenWeather Response \(response) ")
                    viewController.didSuccess(response)
                    //debugPrint(response)
                case .failure(let error):
                    print("DEBUG>> OpenWeather Get Error : \(error.localizedDescription)")
                    debugPrint(response)
                }
            }
    }
    
}
