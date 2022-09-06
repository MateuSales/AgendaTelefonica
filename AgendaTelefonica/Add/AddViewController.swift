import UIKit

protocol AddViewControllerDelegate: AnyObject {
    func addButtonTapped(name: String, number: String)
}

class AddViewController: UIViewController {
    weak var delegate: AddViewControllerDelegate?

    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 40
        stack.axis = .vertical
        return stack
    }()
    
    private let nameTextField = CustomTextField(
        placeholder: "Digite o nome",
        keyboardType: .namePhonePad
    )
    
    private let numberTextField = CustomTextField(
        placeholder: "Digite o número",
        keyboardType: .numberPad
    )
    
    private let addButton = CustomButton(
        title: "Adicionar"
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        addButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        
        addViewsInHierarchy()
        setupConstraints()
    }
    
    private func addViewsInHierarchy() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(numberTextField)
        stackView.addArrangedSubview(addButton)
    }
    
    private func setupConstraints() {
        func makeConstraint(for someView: UIView) -> [NSLayoutConstraint] {
            [
                someView.heightAnchor.constraint(equalToConstant: 50),
                someView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8)
            ]
        }

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate(makeConstraint(for: nameTextField))
        NSLayoutConstraint.activate(makeConstraint(for: numberTextField))
        NSLayoutConstraint.activate(makeConstraint(for: addButton))
    }
    
    @objc private func didTapAddButton() {
        if let name = nameTextField.text,
           let number = numberTextField.text {
            delegate?.addButtonTapped(name: name, number: number)
            navigationController?.popViewController(animated: true)
        }
    }
}
