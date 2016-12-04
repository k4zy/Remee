import UIKit
import APIKit

class EntryListViewController: UITableViewController {
    var items: [Entry] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let request = HotEntryRequest()
        Session.send(request) { result in
            switch result {
            case .success(let response):
                self.items = response
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EntryItemCell", for: indexPath as IndexPath) as? EntryItemCell else {
            fatalError("Invalid cell")
        }

        let item = items[indexPath.row]
        cell.update(withItem: item)

        return cell
    }

}
