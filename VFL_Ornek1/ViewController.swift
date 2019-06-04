//
//  ViewController.swift
//  VFL_Ornek1
//
//  Created by Furkan Sabaz on 4.06.2019.
//  Copyright © 2019 Furkan Sabaz. All rights reserved.
//


/*
 
 [view1] -> bir view'i belirtmek için kullanılır
 [view1]-[view2] -> 2 view arasında standart boşluk miktarını bırakır bu da genelde 8 pt olur
 | | -> superview
 H: ile yatay kastedilir
 V: ile dikey kastedilir
 
 
 -miktar- ile constraint atanır. Bu ifade view'den önce veya sonra gelebilir -10-[view] [view]-20-
 solunda veya sağında olması önemlidir.
 eğer başta H: varsa kısıt yatayda uygulanır. Soldaysa soldan boşluk sağdaysa sağdan boşluk bırakır
 eğer başta V: varsa kısıt dikeyde uygulanır. soldaysa yukarıdan boşluk sağdaysa aşağıdan boşluk bırakır.
 
 
 [view(miktar)]
 Eğer başta H varsa atanan değer genişlik eğer başta V: varsa yükseklik olarak atanır
 Eğer herhangi bir miktar değeri girilmesze başta verilen H-V ifadesine göre tüm yeri kapsar.
 
 @değer ile priority değeri atanır. Örneğin -15@750-[view1] veya [view1(50@250)]
 
 [view(>=60<=100)] ile aralık verebiliriz. Örneğin başta H varsa bu view'in genişliği duruma göre 60-100 arasında olacaktır.
 
 
 
 */
import UIKit

class ViewController: UIViewController {

    
    let kirmiziView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    let maviView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        view.addSubview(kirmiziView)
        view.addSubview(maviView)
        
        let viewTumu = ["kirmiziView" : kirmiziView,"maviView" : maviView]
        
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[kirmiziView(100)]|", options: [], metrics: nil, views: viewTumu))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[kirmiziView(150)]|", options: [], metrics: nil, views: viewTumu))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[maviView(150@250)]|", options: [], metrics: nil, views: viewTumu))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[maviView(==kirmiziView@750)]|", options: [], metrics: nil, views: viewTumu))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[kirmiziView]-30-[maviView]|", options: [], metrics: nil, views: viewTumu))
        
        
        
    }

}

