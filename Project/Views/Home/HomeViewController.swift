//
//  HomeViewController.swift
//  Xcaret
//
//  Created by Jairo on 03/03/20.
//  Copyright © 2020 Movil. All rights reserved.
//

import UIKit

/*
 Para hacer que la vista UICollectionView se desplazara de uno en uno se hiceron las siguientes cosas:
 
 1.- En el archivo .xib se habilito la opcion Paging enabled
 2.- Mediante el UICollectionViewDelegateFlowLayout se indico a la colleccion que la vista de su celda ocuparia una anchura igual su contenedor
 3.- La altura de la colleccion esta basada en la vista contenedora usando el atributo multiplier, este caso seria de un 20% de la altura total, decidí hacerlo así para que ocupara un espacio adecuado en todas las pantallas posibles, desde un iPhone 7 hasta un iPhone 11 pro
 */

class HomeViewController: UIViewController{
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var parksCollectionView: UICollectionView!
    private let identifier = "ParckCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*MARK: En esta vista se realiza la carga de la información antes de ingresar al home*/
        /*El servicio general de la app tiene la función de descargar la información antes de proceder a entrar al home*/
        
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "parks", withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                return
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        guard let launch = try? decoder.decode([ParkModel].self, from: data) else {
            return
        }
        
        GeneralService.parks = launch
        
        
        let nib = UINib(nibName: identifier, bundle: nil)
        parksCollectionView.dataSource = self
        parksCollectionView.delegate = self
        parksCollectionView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        parksCollectionView.register(nib, forCellWithReuseIdentifier: identifier)
        
        self.showImageBack(pos: 0) //Se pinta la primera imagen
        // Do any additional setup after loading the view.
    }
    
    /*MARK: Esta funcion ayuda a obtener la celda visible al finalizar el desplazamiento de la vista*/
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var closestCell = UICollectionViewCell()
        
        for cell in parksCollectionView!.visibleCells as [UICollectionViewCell] {
            let closestCellDelta = abs(closestCell.center.x - parksCollectionView.bounds.size.width/2.0 - parksCollectionView.contentOffset.x)
            let cellDelta = abs(cell.center.x - parksCollectionView.bounds.size.width/2.0 - parksCollectionView.contentOffset.x)
            if (cellDelta < closestCellDelta){
                closestCell = cell
            }
        }
        let indexPath = parksCollectionView.indexPath(for: closestCell)
        
        self.showImageBack(pos: indexPath!.item)
    }
    
    /*Esta funcion se encarga de pintar la imagen del background, mima que recibe como parametro la posicion del objecto Park para que pueda ser llamado desde el ViewDidload al iniciar la vista por primera vez, considerando que la imagen se cambiara cada que ocurra un desplazamiento*/
    func showImageBack(pos: Int){
        self.backgroundImg.image = UIImage(named: GeneralService.parks[pos].img)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        GeneralService.parks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let yourVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabbarViewController") as! TabbarViewController
        yourVC.detailPark = GeneralService.parks[indexPath.item]
        
        GeneralService.primaryColor = UIColor(hexString: GeneralService.parks[indexPath.item].primaryColor)
        self.navigationController?.pushViewController(yourVC, animated: true)
    }   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = parksCollectionView.dequeueReusableCell(withReuseIdentifier: "ParckCollectionViewCell", for: indexPath) as? ParckCollectionViewCell else { return UICollectionViewCell() }
        
        cell.imagePark.image = UIImage(named: GeneralService.parks[indexPath.item].imgthumb)
        cell.namePark.text = GeneralService.parks[indexPath.item].name
        cell.descPark.text = GeneralService.parks[indexPath.item].slogan
        
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width-10, height: view.frame.height)
    }
}
