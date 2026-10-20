import UIKit

public class BrickCategoryAdapter: NSObject, UITableViewDataSource {
    
    private static let tag = "BrickCategoryAdapter"
    
    private var categories: [UIView] = []
    
    public init(categories: [UIView]) {
        self.categories = categories
        super.init()
    }
    
    public func updateCategories(_ newCategories: [UIView]) {
        self.categories = newCategories
    }
    
    // MARK: - UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BrickCategoryCell") ?? UITableViewCell(style: .default, reuseIdentifier: "BrickCategoryCell")
        
        // Удаляем старые вложенные подпредставления на случай переиспользования ячейки
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        
        let categoryView = categories[indexPath.row]
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(categoryView)
        
        NSLayoutConstraint.activate([
            categoryView.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
            categoryView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
            categoryView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
            categoryView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor)
        ])
        
        return cell
    }
    
    public func getItem(at index: Int) -> String? {
        guard index >= 0 && index < categories.count else { return nil }
        // Эквивалент извлечения текста категории из дочернего TextView
        if let stackView = categories[index] as? UIStackView,
           let label = stackView.arrangedSubviews.indices.contains(1) ? stackView.arrangedSubviews[1] as? UILabel : nil {
            return label.text
        } else if let label = categories[index].subviews.indices.contains(1) ? categories[index].subviews[1] as? UILabel : nil {
            return label.text
        }
        return nil
    }
}
