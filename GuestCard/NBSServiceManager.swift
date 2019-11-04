import UIKit

struct Constants {
    static let APP_URL_GET_CATEGORY = ""
    
    static let TIME_OUT = 120.0//90.0
    static let GET = "GET"
    static let POST = "POST"
    static let DELETE = "DELETE"
    static let PUT = "PUT"
    static let UPDATE = "UPDATE"
    static let CONTENT_TYPE = "application/json"
}

var statusCode:Int?



class NBSServiceManager: NSObject,URLSessionDelegate,URLSessionTaskDelegate

{
    
    static let sharedInstance : NBSServiceManager = {
        let instance = NBSServiceManager()
        return instance
    }()


func guestcardapi(parameterDict:NSDictionary , block: @escaping (NSDictionary?, NSError?, Int?) -> Void) {
    
    var urlstring = "https://goferapi.ambivo.com/user/tenant/wtl2"
    
    urlstring = urlstring.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    
    let dealURL = NSURL(string: urlstring)
    
    var reqData: NSData?
    do{
        print("PrameterDict is :\(parameterDict)")
        reqData = try JSONSerialization.data(withJSONObject: parameterDict, options: .prettyPrinted) as NSData?
    }catch{
        
    }
    callServiceWithStatusBlockAll(block: block, APIName: "guestcardapi", MethodType: Constants.POST, URL: dealURL!, Bodydata: reqData as NSData?, ContentType: Constants.CONTENT_TYPE)
    
    
}


func callServiceWithStatusBlockAll(block: @escaping (NSDictionary?, NSError?, Int? ) -> Void?, APIName api: String, MethodType methodType: String?, URL aUrl: NSURL, Bodydata bodyData: NSData?, ContentType contentType: String)
{
    var responseDict:NSDictionary? = nil
    
    do
    {
        var request = URLRequest(url: aUrl as URL, cachePolicy: NSURLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: Constants.TIME_OUT)
        if let methodType = methodType  {
            request.httpMethod = methodType
        } else {
            request.httpMethod = Constants.GET
        }
        print("WEB SERVICE URL is :\n \(aUrl)")
        
        request.addValue(contentType, forHTTPHeaderField: "Content-Type")
        print("contentType is :\n \(request) , \(contentType)")
        
        let authorizationKey = "Bearer ".appending("849e1916-df94-4972-95b9-5a6008f1529c")
        request.addValue(authorizationKey, forHTTPHeaderField: "Authorization")
        
        //request.setValue("Bearer \(SessionData.sharedInstance.sessionAuthToken)", forHTTPHeaderField: "Authorization")
        
        if let bodyData_ = bodyData  {
            print("BodyData: \(String(data: bodyData_ as Data, encoding: String.Encoding.utf8)!)")
            request.httpBody = bodyData_ as Data!
        }
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
        
        
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
            if let error_ = error
            {
                print(error_.localizedDescription)
                
                DispatchQueue.main.async {
                    block(nil, error as NSError?,nil)
                }
            }
            else
            {
                if let httpResponse = response as? HTTPURLResponse
                {
                    if(httpResponse.statusCode == 200)
                    {
                        if let responseData = data
                        {
                            if let responseString = NSString(data: responseData, encoding: 4){
                                print("\nResponse:\(responseString)")
                            }
                            
                            do{
                                let responseDictionary =  try JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions()) as? NSDictionary
                                responseDict = responseDictionary
                                
                                if let AuthorizationKey = httpResponse.allHeaderFields["Authorization"] as? String
                                {
//                                    SessionData.sharedInstance.sessionAuthToken = AuthorizationKey
                                }
                                
                                DispatchQueue.main.async
                                    {
                                        block(responseDict,nil,httpResponse.statusCode)
                                }
                                
                            }
                            catch{
                                print("JSON Parse Error")
                                DispatchQueue.main.async {
                                    block(nil,NSError(domain:"Error" ,code : 1000 , userInfo: nil),httpResponse.statusCode)
                                }
                                
                            }
                        }
                        else
                        {
                            
                        }
                    }
                    else if(httpResponse.statusCode == 401)
                    {
                        DispatchQueue.main.async
                            {
//                                let appDel = UIApplication.shared.delegate as! AppDelegate
//
//                                appDel.logoutString = "Session Expired".localized()
//                                appDel.isloggedIn = false
//
//                                appDel.tabIndex = 0
//
//                                let mainVcIntial = kConstantObj.SetSecondMainViewController("myTabbarViewController")
//
//                                let window = (UIApplication.shared.delegate as? AppDelegate)?.window
//                                //let tabBar = UIStoryboard(name: "SubStory", bundle: nil).instantiateViewController(withIdentifier: "mainTabBar") as! mainTabBar
//                                window?.rootViewController = mainVcIntial//tabBar
//
//                                window?.makeKeyAndVisible()
                                
                        }
                    }
                    else
                    {
                        if let responseData = data
                        {
                            if let responseString = NSString(data: responseData, encoding: 4){
                                print("\nResponse:\(responseString)")
                            }
                            
                            do{
                                let responseDictionary =  try JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions()) as? NSDictionary
                                responseDict = responseDictionary
                                
                                if let AuthorizationKey = httpResponse.allHeaderFields["Authorization"] as? String
                                {
//                                    SessionData.sharedInstance.sessionAuthToken = AuthorizationKey
                                }
                                
                                DispatchQueue.main.async
                                    {
                                        block(responseDict,nil,httpResponse.statusCode)
                                }
                                
                            }
                            catch{
                                print("JSON Parse Error")
                                DispatchQueue.main.async {
                                    block(nil,NSError(domain:"Error" ,code : 1000 , userInfo: nil),httpResponse.statusCode)
                                }
                                
                            }
                        }
                        else
                        {
                            
                        }
                    }
                }
                
                
                
                
            }
        })
        dataTask.resume();
    }
    
}



}
