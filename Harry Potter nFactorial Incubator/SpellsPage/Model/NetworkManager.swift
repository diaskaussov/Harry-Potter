
import Foundation

final class NetworkManager {
    func downloadData(
        with url: String,
        completion: @escaping ([Spell]?) -> Void
    ) {
        guard let dataUrl = URL(string: url) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: dataUrl) { data, response, error in
            if error != nil {
                completion(nil)
                return
            }

            guard let data else {
                completion(nil)
                return
            }
            
            let spells = self.parseJson(data: data)
            
            completion(spells)
            
        }.resume()
    }
    
    private func parseJson(data: Data) -> [Spell]? {
        do {
            let decodedData = try JSONDecoder().decode([Spell].self, from: data)
            return decodedData
        } catch {
            return nil
        }
    }
}
