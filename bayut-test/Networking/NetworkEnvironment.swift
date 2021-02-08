
import Foundation

class NetworkEnvironment {
    private static var servers = serversFromJSONFile(fileName: "Servers")
    
    static func all() -> [Server] {
        return servers
    }
    
    static func serverWithName(name: String) -> Server {
        let filtered = servers.filter { $0.name == name }
        if let first = filtered.first {
            return first
        }
        
        return all().first!
    }
    
    static func addServer(newServer: Server) -> [Server] {
        servers.append(newServer)
        return all()
    }
    
    private static func readJSONData(resource: String) -> Data? {
        // load json data
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            return nil
        }
        
        return try? Data.init(contentsOf: URL.init(fileURLWithPath: path))
    }
    
    private static func serversFromJSONFile(fileName: String) -> [Server] {
        if let data = readJSONData(resource: fileName) {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let servers = try decoder.decode([Server].self, from: data)
                return servers
            } catch {
                print(error.localizedDescription)
            }
        }
        return [Server]()
    }
}

class Server: Codable {
    var name: String
    var urlString: String
    
    var url: URL? {
        guard let url = URL(string: self.urlString) else {
            return nil
        }
        return url
    }
    
    enum CodingKeys: String, CodingKey {
        case name, urlString
    }
}
