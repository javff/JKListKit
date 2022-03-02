//
//  CasesViewController.swift
//  JKListKitExampleApp
//
//  Created by Juan vasquez on 02-03-22.
//

import UIKit

class CasesViewController: UITableViewController {

    let examples: [Example] = Example.allCases

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "JKListKit"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examples.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let example = examples[indexPath.row]
        cell.textLabel?.text = example.name
        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let example = examples[indexPath.row]
        let viewController = ExampleFactory.makeCaseViewController(example: example)
        show(viewController, sender: self)
    }
}
