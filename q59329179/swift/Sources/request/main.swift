import Foundation

// Create a dictionary to encode
let payload: [String: Encodable] = ["string": "string value", "number": 12345, "bool": false]

// Encode the payload as JSON
guard
        let data = try? JSONSerialization.data(withJSONObject: payload)
        else { fatalError("unable to encode JSON data") }

let url = URL(string: "http://localhost:8080")!
var request = URLRequest(url: url)
request.httpMethod = "POST"
request.httpBody = data
request.addValue("application/json", forHTTPHeaderField: "Content-Type")
request.addValue("application/json", forHTTPHeaderField: "Accept")

let task = URLSession.shared.dataTask(with: request) { _,_,_ in
    print("done");
}
task.resume()

RunLoop.main.run()