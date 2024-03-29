# MHVerifyCodeView

[![CI Status](https://img.shields.io/travis/feaskters/MHVerifyCodeView.svg?style=flat)](https://travis-ci.org/feaskters/MHVerifyCodeView)
[![Version](https://img.shields.io/cocoapods/v/MHVerifyCodeView.svg?style=flat)](https://cocoapods.org/pods/MHVerifyCodeView)
[![License](https://img.shields.io/cocoapods/l/MHVerifyCodeView.svg?style=flat)](https://cocoapods.org/pods/MHVerifyCodeView)
[![Platform](https://img.shields.io/cocoapods/p/MHVerifyCodeView.svg?style=flat)](https://cocoapods.org/pods/MHVerifyCodeView)



## Example

![VerifyCodeView](https://s1.ax1x.com/2020/04/30/JqcKXj.gif)



## Sample

```swift
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadViews(in: view)
    }
    
    // MARK: View
    
    private func loadViews(in box: UIView) {
        box.backgroundColor = .lightGray
        
        box.addSubview(mhField)
        [mhField].forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
        })
        NSLayoutConstraint.activate([
            mhField.centerYAnchor.constraint(equalTo: box.centerYAnchor, constant: 0.0),
            
            mhField.leftAnchor.constraint(equalTo: box.leftAnchor, constant: 0.0),
            mhField.rightAnchor.constraint(equalTo: box.rightAnchor, constant: 0.0),
            // Static constraint needed.
            mhField.heightAnchor.constraint(equalToConstant: 64.0),
        ])
    }
    
    private func shouldSendCode(_ code: String) {
        let message = "shouldSendCode, code=\(code)"
        print("MOON__Log" + message)
        let alert = UIAlertController(title: "Hint", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default))
        present(alert, animated: true)
    }
    
    private lazy var mhField: MHVerifyCodeView = {
        let field = MHVerifyCodeView { [weak self] code in
            self?.shouldSendCode(code)
        }
        return field
    }()
}

```



## Author

[feaskters](739296759@qq.com)



## Contributor

[darkThanBlack](https://github.com/darkThanBlack)



## Update

2024/03/29.    Completely refactored by [darkThanBlack](https://github.com/darkThanBlack).

2020/04/30.    Created by [feaskters](739296759@qq.com).



## License

MHVerifyCodeView is available under the MIT license. See the LICENSE file for more info.
