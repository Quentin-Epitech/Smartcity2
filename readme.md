API :
https://www.data.gouv.fr/api/1/datasets/r/402aa4fe-86a9-4dcd-af88-23753e290a58


Api call example Stackowerflow : 

func fetchPost() {
    let url = URL(string: "https://www.data.gouv.fr/api/1/datasets/r/402aa4fe-86a9-4dcd-af88-23753e290a58")!

    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Erreur :", error)
            return
        }
        
        if let data = data,
           let text = String(data: data, encoding: .utf8) {
            print("Réponse :\n\(text)")
        }
    }.resume()
}


