//
//  ViewController.swift
//  Receitas fit
//
//  Created by Anna Carolina Costa Andrade on 20/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var categoryCollection: UICollectionView!
    @IBOutlet weak var recentCollection: UICollectionView!
    
    let scrollView = UIScrollView()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.pageIndicatorTintColor = .systemGreen
        pageControl.currentPageIndicatorTintColor = UIColor.init(_colorLiteralRed: 23/255, green: 49/255, blue: 3/255, alpha: 1)
        return pageControl
    }()
    
    let categoryImageSet = [
        UIImage(named: "Group 5"),
        UIImage(named: "Group 1"),
        UIImage(named: "Group 3"),
        UIImage(named: "Group 2")
    ]
    
    let recentImageSet = [
        UIImage(named: "omelete"),
        UIImage(named: "panqueca"),
        UIImage(named: "Whey e banana"),
        UIImage(named: "pizza de cogumelo")
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        pageControl.addTarget(self, action: #selector ( pageControlDidChanged(_:)), for: .valueChanged)
        
        mainScrollView.addSubview(pageControl)
        mainScrollView.addSubview(scrollView)
        
        categoryCollection.register(CategoryCollectionViewCell.nib(), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        recentCollection.register(RecentCollectionViewCell.nib(), forCellWithReuseIdentifier: "RecentCollectionViewCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 170, height: 130)
        recentCollection.collectionViewLayout = layout
        
        categoryCollection.delegate = self
        categoryCollection.dataSource = self
        
        recentCollection.delegate = self
        recentCollection.dataSource = self

        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        pageControl.frame = CGRect(x: 10, y: 230, width: 370, height: 40)
        scrollView.frame = CGRect(x: 0, y: 90, width: view.frame.size.width, height: 150)
        
        if scrollView.subviews.count == 2 {
            configScrollView()
        }
    }


    @objc private func pageControlDidChanged(_ sender: UIPageControl) {
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width,
                                            y: 0), animated: true)
    }
    
    func configScrollView() {
        scrollView.contentSize = CGSize(width: view.frame.size.width*3, height: scrollView.frame.size.height)
        scrollView.isPagingEnabled = true
        let images = [
            UIImage(named: "TOP"),
            UIImage(named: "NATURAL"),
            UIImage(named: "MASSAS")
        ]
        
        for x in 0..<3 {
            let page = UIImageView(frame: CGRect(x: CGFloat(x) * view.frame.size.width + 10, y: 0, width: view.frame.size.width - 20, height: scrollView.frame.size.height))
            page.image = images[x]
            page.contentMode = .scaleToFill
            page.layer.masksToBounds = true
            page.layer.cornerRadius = 10.0
            scrollView.addSubview(page)
        }
    }
}

extension ViewController: UIScrollViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        categoryCollection.deselectItem(at: indexPath, animated: true)
        
        print("Voce me tocou!")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollection {
            let cell = categoryCollection.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell
            
            switch indexPath.row {
            case 0:
                cell?.categoryLabel.text = "Petiscos"
                cell?.categoryImage.image = categoryImageSet[indexPath.item]

            case 1:
                cell?.categoryLabel.text = "Vegetarianos"
                cell?.categoryImage.image = categoryImageSet[indexPath.item]

            case 2:
                cell?.categoryLabel.text = "Gluten Free"
                cell?.categoryImage.image = categoryImageSet[indexPath.item]

            case 3:
                cell?.categoryLabel.text = "Smoothies"
                cell?.categoryImage.image = categoryImageSet[indexPath.item]

            default:
                cell?.categoryLabel.text = ""
            }
            
            return cell!
            
        } else {
            let cell = recentCollection.dequeueReusableCell(withReuseIdentifier: "RecentCollectionViewCell", for: indexPath) as? RecentCollectionViewCell
            
            switch indexPath.row {
            case 0:
                cell?.recentLabel.text = "Omelete"
                cell?.recentImage.image = recentImageSet[indexPath.item]

            case 1:
                cell?.recentLabel.text = "Panquecas"
                cell?.recentImage.image = recentImageSet[indexPath.item]

            case 2:
                cell?.recentLabel.text = "Whey e banana"
                cell?.recentImage.image = recentImageSet[indexPath.item]

            case 3:
                cell?.recentLabel.text = "Pizza de cogumelos"
                cell?.recentImage.image = recentImageSet[indexPath.item]

            default:
                cell?.recentLabel.text = ""
            }
            
            return cell!
        }
        
        
    }
    
}


