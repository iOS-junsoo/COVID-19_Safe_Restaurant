//
//  ViewController.swift
//  COVID-19_Safe_Restaurant
//
//  Created by 준수김 on 2021/10/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    var count = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBtn(_ sender: UIButton) {
        Request().getRequestData(self)
        //WeatherReques인스턴스 생성후 그 안에 있는 getWeatherData를 호출
        count += 1
    }
    
}

extension ViewController {
    
    func didSuccess(_ response: Restaurant) {
        
        let name = response.Grid_20200713000000000605_1.row[count].RELAX_RSTRNT_NM
        let location1 = response.Grid_20200713000000000605_1.row[count].RELAX_ADD1
        let location2 = response.Grid_20200713000000000605_1.row[count].RELAX_ADD2
        let number = response.Grid_20200713000000000605_1.row[count].RELAX_RSTRNT_TEL
        //받은 response에서 첫번째 weather의 main response
        
        self.Label.text = name
        self.Label.sizeToFit()
        
        self.Label2.text = location1
        self.Label2.sizeToFit()
        
        self.label4.text = location2
        self.label4.sizeToFit()
        
        self.Label3.text = number
        self.Label3.sizeToFit()
        
    }
    
}

