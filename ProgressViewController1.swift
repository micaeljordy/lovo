import UIKit
import Foundation

class ProgressViewController1: UIViewController {
    
    var plantas = [Planta]()
    var temperatura1 : Float?
    var umidade1 : Float?
    
    @IBOutlet weak var fotoPlantaImageView: UIImageView!
    

    @IBOutlet weak var nomeDaPlanta: UILabel!
    
    @IBOutlet weak var especiePlantaLabel: UILabel!
    
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var umidadeProgressView: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        downloadJSON {
            print("sucess")
            self.temperatura1 = self.plantas.last?.temperatura
            self.umidade1 = self.plantas.last?.umidade
            print(self.temperatura1)
            print(self.umidade1)
            print("Umidade Did: \(self.umidade1)")
            
            
            
            switch Int(self.temperatura1 ?? 0) {
            
            case (30...100):
            self.fotoPlantaImageView.image = UIImage(named: "calor")
            
            
            case (0...20):
            self.fotoPlantaImageView.image = UIImage(named: "frio")
            default:
                self.fotoPlantaImageView.image = UIImage(named: "planta")
            }
            
            switch Int(self.umidade1 ?? 0) {
            case 75...100:
                self.fotoPlantaImageView.image = UIImage(named: "afogando")
            
            
            case 0...25:
            self.fotoPlantaImageView.image = UIImage(named: "sede")
                
            default:
                self.fotoPlantaImageView.image = UIImage(named: "planta")
            }
            
                
            
            
            
            self.update()
        }
        setupProgress()
            
       
        
    }
    
    func setupProgress() {
        self.umidadeProgressView.transform = self.umidadeProgressView.transform.scaledBy(x: 1.5, y: 8)
        self.umidadeProgressView.progressViewStyle = .default
        self.umidadeProgressView.layer.cornerRadius = 10
        self.umidadeProgressView.clipsToBounds = true
        self.umidadeProgressView.layer.sublayers![1].cornerRadius = 10
        self.umidadeProgressView.subviews[1].clipsToBounds = true
        self.progressView.transform = self.progressView.transform.scaledBy(x: 1.5, y: 8)
        self.progressView.progressViewStyle = .default
        self.progressView.layer.cornerRadius = 10
        self.progressView.clipsToBounds = true
        self.progressView.layer.sublayers![1].cornerRadius = 10
        self.progressView.subviews[1].clipsToBounds = true
        self.progressView.tintColor = UIColor.red
        
        
        
        
    }
    
    func update() {
        DispatchQueue.global().async {
            var current:Int = 0
            let total = 100
            while (current < total) {
                current += 1
                DispatchQueue.main.async {  // To update UI
                    self.progressView.progress = self.progredirTemperatura(temperatura: self.temperatura1!)
//                    self.umidadeProgressView.progress = 0.5
                    self.umidadeProgressView.progress = self.progredirUmidade(umidade: self.umidade1!)
                    self.progressView.setProgress(self.progressView.progress, animated: true)
                    self.umidadeProgressView.setProgress(self.umidadeProgressView.progress, animated: true)
                    print(Float(current / total))
                }
                sleep(UInt32(0.1))
            }
        }
        
        
        print("Temperatura Up \(temperatura1)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }   
    
    func progredirTemperatura(temperatura: Float) -> Float {
        var progress: Float
        
        progress = (temperatura) / 40
        
        return progress
        
    }
    
    func progredirUmidade(umidade: Float) -> Float {
        var progress: Float
        
        progress = (umidade) / 100
        
        return progress
        
    }
    
    func downloadJSON (completed : @escaping () -> ()) {
        let url = URL(string : "http://192.168.128.32:1880/leituraIoT")
        
        URLSession.shared.dataTask(with: url!) { data, response, err in
            
            if err == nil {
                do {
                    self.plantas = try JSONDecoder().decode([Planta].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                        
                        
                        
                    }
                }
                catch {
                    print("error fetching data from api")
                }
            }
        }.resume()
    }

}



