//
//  ViewController.swift
//  LoginScreenAuth
//
//  Created by Gaditek on 02/12/2021.
//

import UIKit

class ViewController: UIViewController {
    let imageView = UIImageView()
    let textView = UITextView()
    let topView = UIView()
    let subTextView = UITextView()
    let previousButton = UIButton()
    let nextButton = UIButton()
    let pageNavigationBar = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(topView)
        view.addSubview(textView)
        view.addSubview(subTextView)
        ViewsUIConstraints()
        buttonControl()
    }
    
    func buttonControl() {
    
        previousButton.setTitle("PREV", for: .normal)
        previousButton.setTitleColor(.blue, for: .normal)
        previousButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        
        nextButton.setTitleColor(.blue, for: .normal)
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        pageNavigationBar.currentPage = 0
        pageNavigationBar.numberOfPages = 4
        pageNavigationBar.pageIndicatorTintColor = .gray
        pageNavigationBar.currentPageIndicatorTintColor = .black
        pageNavigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomStackView = UIStackView(arrangedSubviews: [previousButton,pageNavigationBar,nextButton])
        
        bottomStackView.distribution = .fillEqually
        view.addSubview(bottomStackView)
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func ViewsUIConstraints(){
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topView.addSubview(imageView)
        
        imageView.image = UIImage(named: "img60")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.5).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true

        textView.text = "this is description text"
        textView.font = UIFont.boldSystemFont(ofSize: 20)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.isSelectable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        textView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        subTextView.text = "this is sub description text this is sub description text this is sub description text this is sub description text this is sub description text.."
        subTextView.font = UIFont.boldSystemFont(ofSize: 13)
        subTextView.textAlignment = .center
        subTextView.isEditable = false
        subTextView.isScrollEnabled = false
        subTextView.isSelectable = false
        subTextView.translatesAutoresizingMaskIntoConstraints = false
        subTextView.topAnchor.constraint(equalTo: textView.bottomAnchor).isActive = true
        subTextView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive = true
        subTextView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20).isActive = true
    }
}
