import UIKit

class HomeTableViewCell: UITableViewCell {
    private let contactImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 23
        view.layer.masksToBounds = true
        view.tintColor = .darkGray
        view.image = UIImage(systemName: "person.circle.fill")
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        selectionStyle = .none
        contentView.backgroundColor = .clear
        addViewsInHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(name: String, number: String) {
        nameLabel.text = name
        numberLabel.text = number
    }
    
    private func addViewsInHierarchy() {
        contentView.addSubview(contactImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(numberLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contactImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            contactImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            contactImage.widthAnchor.constraint(equalToConstant: 56),
            contactImage.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: contactImage.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            numberLabel.leadingAnchor.constraint(equalTo: contactImage.trailingAnchor, constant: 16),
            numberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            numberLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
