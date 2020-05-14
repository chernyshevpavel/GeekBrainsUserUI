//
//  ViewController.swift
//  user_ui
//
//  Created by Павел Чернышев on 25.12.2019.
//  Copyright © 2019 Павел Чернышев. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var wkwebview: WKWebView! {
        didSet{
            wkwebview.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: PrivateInfo.shared.getVkClientId),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "photos"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        wkwebview.load(request)
    }


    @IBAction func enterTap(_ sender: Any) {
        let login = loginTextField.text ?? ""
        let pass = passwordTextField.text ?? ""
        print("login: " + login + " password: " + pass)
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        print(fragment)
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        let token = params["access_token"]
        Session.shared.token = token ?? ""
        let userId = params["user_id"]
        Session.shared.userId = userId ?? ""
        
        //Получение списка друзей
        let configuration = URLSessionConfiguration.default
        let session =  URLSession(configuration: configuration)
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/friends.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "order", value: "name"),
            URLQueryItem(name: "count", value: "2"),
            URLQueryItem(name: "offset", value: "2"),
            URLQueryItem(name: "fields", value: "first_name"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.68"),
        ]
        var request = URLRequest(url: urlConstructor.url!)
        var task = session.dataTask(with: request) { (data, response, error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            print("Получение списка друзей")
            print(json)
        }
        task.resume()
        //Получение фотографий человека
        urlConstructor.path = "/method/photos.getAll";
        urlConstructor.queryItems = [
            URLQueryItem(name: "owner_id", value: "87740216"),
            URLQueryItem(name: "count", value: "2"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.68"),
        ]
        request = URLRequest(url: urlConstructor.url!)
        task = session.dataTask(with: request) { (data, response, error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            print("//Получение фотографий человека")
            print(json)
        }
        task.resume()
        // Получение групп текущего пользователя;
        urlConstructor.path = "/method/groups.get";
        urlConstructor.queryItems = [
            URLQueryItem(name: "fields", value: "name"),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "count", value: "2"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.68"),
        ]
        request = URLRequest(url: urlConstructor.url!)
        task = session.dataTask(with: request) { (data, response, error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            print("Получение групп текущего пользователя")
            print(json)
        }
        task.resume()
        //Получение групп по поисковому запросу;
        urlConstructor.path = "/method/groups.search";
        urlConstructor.queryItems = [
            URLQueryItem(name: "q", value: "swift"),
            URLQueryItem(name: "count", value: "5"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.68"),
        ]
        request = URLRequest(url: urlConstructor.url!)
        task = session.dataTask(with: request) { (data, response, error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            print("Получение групп по поисковому запросу")
            print(json)
        }
        task.resume()
        decisionHandler(.cancel)
    }
}

