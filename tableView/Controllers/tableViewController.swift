//
//  ViewController.swift
//  tableView
//
//  Created by Jaimin Solanki on 10/08/23.
//

import UIKit
import Alamofire

class tableViewController: UIViewController {
    
    let name1 = [
        "jaskv",
        "sskdbakk",
        "pkdfaskbh",
        "fsdiak",
        "dkakpk",
        "esdlibsk",
    ]
    
    @IBOutlet weak var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }
    
    //MARK: - Almofire Fetch Request and Get Decoded JSON Data...
    var apiResult: CricData?
    
    func fetchData() {
        
        //            let requestDataURL = Bundle.main.url(forResource: "ApiData", withExtension: "geojson")
        let requestDataURL = "https://api.cricapi.com/v1/cricScore?apikey=43081de8-17ec-4137-b0dd-38e6d0b110c1"
        
        //            AF.request(requestDataURL, method: .get, parameters: nil,encoding: URLEncoding.default).response { response in
        //
        //                switch response.result {
        //
        //                case .success(let data):
        //                    do {
        //                        let jsonData = try JSONDecoder().decode(CricData.self, from: data!)
        //
        //                        print("sjdcvaksbdcjkasbdclbsbkadjaljsdvjas djv")
        //                        self.apiResult = jsonData
        //                        print(self.apiResult!)
        //
        //                    } catch {
        //                        print("Error......\(error.localizedDescription)")
        //                    }
        //
        //                case .failure(let error):
        //                    print(error.localizedDescription)
        //
        //                }
        //            }
        
        
        AF.request(requestDataURL, method: .get, parameters: nil, encoding: URLEncoding.default).response { response in
            
            switch response.result {
                
            case .success(let data):
                
                do {
                    
                    let jsonData = try JSONDecoder().decode(CricData.self, from: data!)
                    
                    print("data mali gyooo")
                    self.apiResult = jsonData
                    print(self.apiResult)
                    
                } catch {
                    
                    print("Error..\(error.localizedDescription)")
                    
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                
                
            }
        }
        
    }
}

extension tableViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return name1.count
        return ((apiResult?.data.count) ?? 100)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        //        cell.label1.text = name1[indexPath.row]
        //        cell.label2.text = name1[indexPath.row]
        cell.label1.text = (apiResult?.data[indexPath.row].t1 ?? "khushish")
        cell.label2.text = (apiResult?.data[indexPath.row].t2 ?? "pk")
        return cell
    }
    
    
}
